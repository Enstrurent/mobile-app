import 'dart:convert';
import 'dart:developer';

import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/services/secure_store.dart';
import 'package:enstrurent/widgets/get_snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class LoginController extends GetxController {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  HttpRequest _reqSender = HttpRequest();
  SecureStore _store = SecureStore();
  var onWait = false.obs;

  Future<bool> loginRequest() async {
    String email = emailText.text.removeAllWhitespace;
    String password = passwordText.text;

    if (email != "" && password != "") {
      if (isEmailValid(email)) {
        var body =
            jsonEncode(<String, String>{'email': email, 'password': password});
        var response = await _reqSender.send("/auth/login", Request.POST,
            body: body, sendToken: false);

        if (response.statusCode == HttpStatus.ok) {
          try {
            Map resBody = json.decode(response.body);
            log("LOG ${resBody["token"]} ${resBody["role"]}");
            resBody.forEach((key, value) async {
             await _store.writeValue(key, value);
            });
            return true;
          } catch (e) {
            log(e, name: "Error on saving credentials ");
            return false;
          }
        } else if (response.statusCode == HttpStatus.unauthorized) {
          getSnackBar("error".tr, "wrong_email_pass".tr);
          return false;
        } else {
          getSnackBar("error".tr, "went_wrong".tr);
          return false;
        }
      } else {
        getSnackBar("error".tr, "email_invalid".tr);
        return false;
      }
    } else {
      getSnackBar("error".tr, "email_pass_empty".tr);
      return false;
    }
  }

  bool isEmailValid(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  Future<void> loginAndNavigate() async {
    onWait.value = true;
    bool loginSuccess = await loginRequest();
    if (loginSuccess) Auth.navigateTo();
    onWait.value = false;
  }
}
