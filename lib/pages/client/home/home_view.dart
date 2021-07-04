import 'dart:developer';

import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/services/secure_store.dart';
import 'package:flutter/material.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:get/get.dart';

class ClientHome extends StatelessWidget {
  SecureStore _store = Get.find();

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
          onClick: () => Auth.signOut(),
          text: "sign_out".tr,
          buttonColor: Get.theme.backgroundColor,
        )),
      ),
    );
  }
}
