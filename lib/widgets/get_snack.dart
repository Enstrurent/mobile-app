import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
