import 'dart:convert';
import 'dart:developer';

import 'package:enstrurent/models/client.dart';
import 'package:enstrurent/models/renter.dart';
import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:get/get_connect/http/src/status/http_status.dart';

class SignUpController extends GetxController {
  final focus = FocusNode();
  var isClientSign = true.obs;
  var _onWait = false.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController passwordReText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController surnameText = TextEditingController();
  TextEditingController phoneNoText = TextEditingController();
  TextEditingController storeNameText = TextEditingController();
  TextEditingController storeInfoText = TextEditingController();

  Widget switchFormButton() => Obx(
        () => RawMaterialButton(
          onPressed: () {
            formKey.currentState!.reset();
            isClientSign.value = !isClientSign.value;
          },
          padding: const EdgeInsets.only(top: 8.0, right: 10),
          shape: CircleBorder(),
          child: Column(children: [
            Icon(
                isClientSign.value
                    ? Icons.store_mall_directory_rounded
                    : Icons.person,
                color: Get.theme.primaryColor),
            Text(
              isClientSign.value ? "business".tr : "personal".tr,
            )
          ]),
        ),
      );

  List<Widget> commonFields() => [
        widgets.FormField(
          fieldLabel: "name".tr,
          controller: nameText,
          iconData: CupertinoIcons.person,
          validatorFunc: (value) =>
              value!.isEmpty ? "empty_value_err".tr : null,
        ),
        widgets.FormField(
          fieldLabel: "surname".tr,
          controller: surnameText,
          iconData: CupertinoIcons.person_fill,
          validatorFunc: (value) =>
              value!.isEmpty ? "empty_value_err".tr : null,
        ),
        widgets.FormField(
            hint: "email_hint".tr,
            controller: emailText,
            iconData: CupertinoIcons.mail,
            textInputType: TextInputType.emailAddress,
            fieldLabel: "email".tr,
            validatorFunc: (email) {
              String p =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = new RegExp(p);
              if (!regExp.hasMatch(email!))
                return "email_invalid".tr;
              else
                return null;
            }),
        widgets.FormField(
            fieldLabel: "password".tr,
            controller: passwordText,
            iconData: CupertinoIcons.lock,
            hint: "******",
            hideText: true,
            validatorFunc: (value) {
              if (value!.isEmpty)
                return "empty_password_err".tr;
              else if (value.length < 6) return "valid_password_err".tr;
              return null;
            }),
        widgets.FormField(
            fieldLabel: "password_re".tr,
            controller: passwordReText,
            iconData: CupertinoIcons.lock,
            hint: "******",
            hideText: true,
            validatorFunc: (value) {
              if (value!.isEmpty)
                return "empty_password_err".tr;
              else if (value.length < 6)
                return "valid_password_err".tr;
              else if (value != passwordText.text)
                return "unmatched_password_err".tr;
              return null;
            }),
        widgets.FormField(
          fieldLabel: "phone_number".tr,
          controller: phoneNoText,
          iconData: CupertinoIcons.phone,
          hint: "+905121231231",
          textInputType: TextInputType.phone,
          validatorFunc: (value) =>
              value!.isEmpty ? "empty_value_err".tr : null,
        ),
        Obx(
          () => Column(
            children: [
              Visibility(
                visible: !_onWait.value,
                child: widgets.Button(
                  buttonColor: Get.theme.primaryColor,
                  text: isClientSign.value ? "confirm".tr : "next".tr,
                  onClick: submitButton,
                ),
              ),
              Visibility(
                  visible: _onWait.value,
                  child: SpinKitCircle(color: Get.theme.primaryColor, size: 30))
            ],
          ),
        ),
      ];

  List<Widget> renterFields() => [
        widgets.FormField(
          controller: storeNameText,
          iconData: Icons.storefront,
          fieldLabel: "store_name".tr,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: TextFormField(
            validator: (value) => value!.isEmpty ? "empty_value_err".tr : null,
            controller: storeInfoText,
            cursorColor: Get.theme.primaryColor,
            style: Get.textTheme.headline6,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: "store_info".tr,
              labelStyle: Get.textTheme.bodyText1!
                  .copyWith(color: Get.theme.primaryColor),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              suffixIcon:
                  Icon(CupertinoIcons.info, color: Colors.grey.shade400),
            ),
          ),
        )
      ];

  List<Widget> withRenterFields() => renterFields() + commonFields();

  void submitButton() async {
    if (formKey.currentState!.validate()) {
      _onWait.value = true;
      var jsonObj = createJson();
      log(jsonObj.toString(), name: "jsonObj");
      HttpRequest requestSender = Get.find();
      var response = await requestSender.send("auth/sign_up", Request.POST,
          body: jsonObj, sendToken: false);
      _onWait.value = false;
      log("code: ${response.statusCode} body: ${response.body}", name: "Status code");
      if (response.statusCode == HttpStatus.conflict)
        widgets.getSnackBar("error".tr, "already_signed_in_err".tr);
      else if (response.statusCode == HttpStatus.ok) {
        Map decodedBody = json.decode(response.body);
        if (Auth.saveAuthToLocal(decodedBody)) {
          Get.offAllNamed("/${decodedBody['role']}");
        } else {
          widgets.getSnackBar("error".tr, "went_wrong".tr);
          log("Error on sign up controller, after saveAuthToLocal!");
        }
      } else
        widgets.getSnackBar("error".tr, "went_wrong".tr);
    }
  }

  String createJson() {
    Map<String, dynamic> json;
    if (isClientSign.value)
      json = Client(
              name: nameText.text,
              surname: surnameText.text,
              email: emailText.text,
              phone_number: phoneNoText.text)
          .toJson();
    else
      json = Renter(
              store_name: storeNameText.text,
              name: nameText.text,
              phone_number: phoneNoText.text,
              store_info: storeInfoText.text,
              surname: surnameText.text,
              email: emailText.text)
          .toJson();

    json["password"] = passwordText.text;
    return jsonEncode(json);
  }
}
