import 'package:enstrurent/pages/login/login_controller.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("login".tr, style: Get.theme.appBarTheme.titleTextStyle)),
      backgroundColor: Get.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            widgets.FormField(
              controller: _controller.emailText,
              fieldLabel: "email".tr,
              hint: "email_hint".tr,
              textInputType: TextInputType.emailAddress,
              iconData: CupertinoIcons.envelope,
            ),
            SizedBox(height: 10),
            widgets.FormField(
              controller: _controller.passwordText,
              fieldLabel: "password".tr,
              hint: "********",
              hideText: true,
              iconData: CupertinoIcons.lock,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 10),
                  Obx(
                    () => Visibility(
                      visible: !_controller.onWait.value,
                      child: widgets.Button(
                        onClick: () => _controller.loginAndNavigate(),
                        buttonColor: Get.theme.primaryColor,
                        text: "login".tr,
                      ),
                    ),
                  ),
                  Obx(() => Visibility(
                        visible: _controller.onWait.value,
                        child: SpinKitCircle(
                          color: Get.theme.primaryColor,
                          size: 40,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
