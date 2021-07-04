import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'button.dart';

getSnackBar(String title, message) {
  if (title == "error".tr)
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: 2),
      backgroundColor: Get.theme.backgroundColor,
      colorText: Colors.white,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      overlayBlur: 3,
    );
  else
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: 2),
      backgroundColor: Get.theme.cardColor,
      colorText: Get.theme.primaryColor,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      overlayBlur: 3,
    );
}


Widget dialogContent(
    {required String headline,
      required String backText,
      required String nextText,
      VoidCallback? backOnClick,
      VoidCallback? nextOnClick}) =>
    Card(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 320),
        color: Get.theme.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(headline,
                style: Get.textTheme.bodyText1),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                    text: backText,
                    onClick: backOnClick,
                    buttonColor: Get.theme.accentColor),
                Button(
                    text: nextText,
                    onClick: nextOnClick,
                    buttonColor: Get.theme.primaryColor)
              ],
            )
          ],
        ));