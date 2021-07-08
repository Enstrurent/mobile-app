import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/pages/products/products_view.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProductCard extends StatelessWidget {
  final Product product;
  final String pageName;
  final VoidCallback? onLongPress;

  const BuildProductCard(
      {Key? key,
      required this.product,
      this.pageName = "/single_product",
      this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // TODO: Add longPress popup button
      splashColor: Get.theme.primaryColor,
      padding: EdgeInsets.all(1),
      onLongPress: onLongPress,
      onPressed: () => Get.toNamed(pageName, arguments: {"product": product}),
      child: Column(
        children: [
          ImageCard(
            imageURL: product.thumbnailNames != null
                ? "https://${HttpRequest.host}/images/${product.thumbnailNames![0]}"
                : "https://via.placeholder.com/600x800.png?text=ENSTRURENT",
            isForRent: product.isRental,
            isForSale: product.isOpenToSell,
            rentalPrice: product.dailyPrice,
            salePrice: product.fullPrice,
          ),
          BottomInfoCard(title: product.generateTitle())
        ],
      ),
    );
  }
}
