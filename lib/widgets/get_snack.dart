import 'package:get/get.dart';

getSnackBar(String title, message) {
  Get.snackbar(title, message,
    duration: Duration(seconds: 2),
    backgroundColor: Get.theme.cardColor,
    colorText: Get.theme.primaryColor,
    isDismissible: true,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    overlayBlur: 3,
  );
}