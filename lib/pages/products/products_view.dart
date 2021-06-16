import 'dart:developer';

import 'package:enstrurent/pages/products/product_drawer.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:enstrurent/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("products_title".tr,
            style: Get.theme.appBarTheme.titleTextStyle),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.gear_alt, color: Get.theme.canvasColor),
              onPressed: () => Get.bottomSheet(appbarButtonContext()))
        ],
      ),
      drawer: ProductDrawer(),
      body: Container(),
    );
  }

// https://source.unsplash.com/random
  Widget buildProductCard() => Card();

  Widget appbarButtonContext() => Wrap(
        alignment: WrapAlignment.spaceAround,
        direction: Axis.vertical,
        runAlignment: WrapAlignment.center,
        children: [
          widgets.Button(
            buttonColor: Colors.black26,
            text: "change_lang".tr,
            onClick: () {
              Get.updateLocale(Get.locale.toString() == "en_US"
                  ? Locale("tr", "TR")
                  : Locale("en", "US"));
              Get.back();
            },
          ),
          Text("data"),
          Text("data"),
        ],
      );
}
