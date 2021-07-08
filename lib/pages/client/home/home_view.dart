
import 'package:enstrurent/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:get/get.dart';

class ClientHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
