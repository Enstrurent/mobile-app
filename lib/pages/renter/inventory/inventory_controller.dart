import 'dart:developer';

import 'package:enstrurent/services/product_service.dart';
import 'package:enstrurent/widgets/getx_widgets.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  RxList products = List.empty(growable: true).obs;
  var onWait = false.obs;

  @override
  onInit() async {
    super.onInit();
    await getRenterProducts();
  }

  getRenterProducts() async {
    onWait.value = true;
    try {
      products.value = await ProductService.getProducts(
          isToken: true, uri: "products/by_renter");
    } catch (err) {
      log(err.toString(), name: "Error on getRenterProducts");
    } finally {
      onWait.value = false;
    }
  }

  Future<void> longPressDelete(String productID) async {
    Get.dialog(
        dialogContent(
            headline: "Ürünü silmek istiyor musunuz?",
            backText: "HAYIR",
            nextText: "EVET",
            nextOnClick: () async {
              bool success = await ProductService.deleteProduct(productID);
              if (success) Get.back();
              Get.defaultDialog(
                  backgroundColor: Get.theme.backgroundColor,
                  middleText: "Ürün kaldırıldı.",
                  title: "Başarılı!",
                  titleStyle: Get.textTheme.headline4);
              await getRenterProducts();
            },
            backOnClick: () => Get.back()),
        barrierColor: Get.theme.backgroundColor.withOpacity(0.9));
  }
}
