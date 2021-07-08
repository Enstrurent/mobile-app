
import 'package:cached_network_image/cached_network_image.dart';
import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/pages/products/products_controller.dart';
import 'package:enstrurent/pages/products/products_widgets/build_product_card.dart';
import 'package:enstrurent/pages/products/products_widgets/product_drawer.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

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
                onPressed: () => Get.bottomSheet(widgets.SettingsButton()))
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
                    itemBuilder: (context, index) => BuildProductCard(
                        product: (_controller.products[index] as Product)),
                  ),
          ),
        ));
  }


}
