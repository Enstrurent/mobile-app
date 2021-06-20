import 'dart:developer';

import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/pages/products/products_controller.dart';
import 'package:enstrurent/pages/products/products_widgets/product_drawer.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

part 'products_widgets/settings_button.dart';

part 'products_widgets/bottom_info_card.dart';

part 'products_widgets/image_card.dart';

class ProductsView extends StatelessWidget {
  ProductsView({Key? key}) : super(key: key);
  final ProductController _controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          title: Text("products_title".tr,
              style: Get.theme.appBarTheme.titleTextStyle),
          centerTitle: true,
          actions: [
            IconButton(
                icon:
                    Icon(CupertinoIcons.gear_alt, color: Get.theme.canvasColor),
                onPressed: () => Get.bottomSheet(SettingsButton()))
          ],
        ),
        drawer: ProductDrawer(),
        body: RefreshIndicator(
          backgroundColor: Get.theme.backgroundColor,
          color: Get.theme.primaryColor,
          onRefresh: () {
            _controller.products.clear();
            return _controller.getAllProducts();
          },
          child: Obx(
            () => _controller.onWait.value
                ? Center(
                    child: SpinKitCircle(
                    color: Get.theme.primaryColor,
                    size: 60,
                  ))
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    itemCount: _controller.products.length,
                    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                    itemBuilder: (context, index) => buildProductCard(
                        (_controller.products[index] as Product),
                        "https://source.unsplash.com/random/$index"),
                  ),
          ),
        ));
  }

  Widget buildProductCard(Product product, String imageURL) => MaterialButton(
        splashColor: Get.theme.primaryColor,
        padding: EdgeInsets.all(1),
        onPressed: () => Get.toNamed("/single_product", arguments: {"product": product}),
        child: Column(
          children: [
            ImageCard(
                imageURL: imageURL,
                isForRent: product.is_rental,
                isForSale: product.is_open_to_sell,
            rentalPrice: product.daily_price, salePrice: product.full_price,),
            BottomInfoCard(title: product.generateTitle())
          ],
        ),
      );
}
