import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/pages/products/products_view.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildProductCard extends StatelessWidget {
  final Product product;
  final String pageName;

  const BuildProductCard(
      {Key? key,
      required this.product,
      this.pageName = "/single_product"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // TODO: Add longPress popup button
      splashColor: Get.theme.primaryColor,
      padding: EdgeInsets.all(1),
      onPressed: () => Get.toNamed(pageName, arguments: {"product": product}),
      child: Column(
        children: [
          ImageCard(
            imageURL: product.thumbnail_names != null
                ? "https://${HttpRequest.host}/images/${product.thumbnail_names![0]}"
                : "https://via.placeholder.com/600x800",
            isForRent: product.is_rental,
            isForSale: product.is_open_to_sell,
            rentalPrice: product.daily_price,
            salePrice: product.full_price,
          ),
          BottomInfoCard(title: product.generateTitle())
        ],
      ),
    );
  }
}
