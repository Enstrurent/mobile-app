import 'package:enstrurent/pages/products/products_widgets/build_product_card.dart';
import 'package:enstrurent/pages/renter/inventory/inventory_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class InventoryView extends StatelessWidget {
  final InventoryController _controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          title:
              Text("inventory".tr, style: Get.theme.appBarTheme.titleTextStyle),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          backgroundColor: Get.theme.backgroundColor,
          color: Get.theme.primaryColor,
          onRefresh: () {
            _controller.products.clear();
            return _controller.getRenterProducts();
          },
          child: Obx(
            () => _controller.onWait.value
                ? Center(
                    child: SpinKitCircle(
                    color: Get.theme.primaryColor,
                    size: 60,
                  ))
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    itemCount: _controller.products.length,
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    itemBuilder: (context, index) => BuildProductCard(
                      product: _controller.products[index],
                      pageName: "/editable_product",
                    ),
                  ),
          ),
        ),
      );
}
