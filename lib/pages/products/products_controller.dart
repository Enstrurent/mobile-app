import 'dart:convert';
import 'dart:developer';

import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/services/product_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ProductController extends GetxController {
  RxList products = List.empty(growable: true).obs;
  var onWait = false.obs;

  Future<void> getAllProducts() async {
    onWait.value = true;
    products.value = await ProductService.getProducts();
    onWait.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }
}