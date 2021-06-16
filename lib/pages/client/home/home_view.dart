import 'dart:developer';

import 'package:enstrurent/services/secure_store.dart';
import 'package:flutter/material.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:get/get.dart';

class ClientHome extends StatelessWidget {
  SecureStore _store = SecureStore();

  getValues() async {
    var token = await _store.readValue("token");
    var role = await _store.readValue("role");

    log("log" + token + role);
  }
  @override
  Widget build(BuildContext context) {
    getValues();
    return Container(
      child: SafeArea(
        child: Center(child: widgets.Button(
          onClick: () {
            SecureStore _store = SecureStore();
            _store.resetAll();
            Get.offAllNamed("/");
          },
          text: "sign_out".tr,
          buttonColor: Get.theme.backgroundColor,
        )),
      ),
    );
  }
}
