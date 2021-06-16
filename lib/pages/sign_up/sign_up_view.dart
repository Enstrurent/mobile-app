import 'package:enstrurent/pages/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  final SignUpController _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text(
            _controller.isClientSign.value
                ? "client_sign_up".tr
                : "renter_sign_up".tr,
            style: Get.theme.appBarTheme.titleTextStyle!.copyWith(fontSize: 26))),
        backgroundColor: Get.theme.backgroundColor,
        actions: [_controller.switchFormButton()],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top:20),
          child: Obx(
            () => Form(
              key: _controller.formKey,
              child: Column(
                children: _controller.isClientSign.value
                    ? _controller.commonFields()
                    : _controller.withRenterFields(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
