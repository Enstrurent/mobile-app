import 'package:cached_network_image/cached_network_image.dart';
import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/widgets/getx_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProductController extends GetxController {
  Map arguments = Get.arguments;
  late Product product;
  RxList<Widget> photoCards = RxList<Widget>();
  bool renterPreview = false;
  @override
  void onInit() {
    super.onInit();
    product = arguments["product"];
    renterPreview = arguments["renterPreview"] ?? false;
    product.imageNames.forEach((element) =>
        photoCards.add(_imageCard(HttpRequest.imageBaseUrl + element)));
  }

  get productName => "${product.brand} ${product.model} ${product.category}";

  Widget _imageCard(String imageURL) => Card(
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              LinearProgressIndicator(
                  value: downloadProgress.progress, minHeight: 30),
          imageUrl: imageURL,
          fit: BoxFit.cover,
        ),
        elevation: 10,
        margin: EdgeInsets.zero,
      );

  rentProductClick() async {
    if (await Auth.validateClient()) {
    } else {
      await notClientDialog();
    }
  }

  purchaseProductClick() async {
    if (await Auth.validateClient()) {
    } else {
      await notClientDialog();
    }
  }

  Future<dynamic> notClientDialog() => Get.dialog(dialogContent(
      headline: "Müşteri olarak giriş yapınız",
      backText: "KAPAT",
      nextText: "GİRİŞ YAP",
      backOnClick: () => Get.back(),
      nextOnClick: () {
        Auth.signOut(); // FIXME
        Get.toNamed("/login");
      }), barrierColor: Get.theme.backgroundColor.withOpacity(0.9));
}
