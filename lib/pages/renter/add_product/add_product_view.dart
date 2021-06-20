import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          title: Text("add_product".tr,
              style: Get.theme.appBarTheme.titleTextStyle),
          centerTitle: true,
        ),
      );
}
