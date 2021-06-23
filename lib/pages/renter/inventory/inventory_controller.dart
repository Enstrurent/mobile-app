import 'dart:developer';

import 'package:enstrurent/services/product_service.dart';
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
}
