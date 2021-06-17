import 'package:enstrurent/pages/single_product/single_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProductView extends StatelessWidget {
  SingleProductController _controller = Get.put(SingleProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
          title: Text(_controller.product.model,
              style: Get.theme.appBarTheme.titleTextStyle),
          centerTitle: true),
      body: Container(),
    );
  }
}
