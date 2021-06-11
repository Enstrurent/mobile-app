import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestDrawerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        color: Get.theme.backgroundColor.withAlpha(80),
        elevation: 15,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              drawerButton("login".tr, () => Get.toNamed("/login")),
              drawerButton("sign_up".tr, () => Get.toNamed("/sign_up")),
            ],
          ),
        ),
      );

  Widget drawerButton(String text, void Function() onPressed) => Padding(
    padding: EdgeInsets.all(16.0),
    child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(16)),
            backgroundColor:
            MaterialStateProperty.all(Get.theme.accentColor.withAlpha(85))),
        child: Text(text,
          style: Get.textTheme.bodyText1,
        )),
  );
}
