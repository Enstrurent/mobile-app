import 'dart:convert';
import 'dart:developer';

import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ProductController extends GetxController {
  HttpRequest _request = Get.find();
  RxList products = List.empty(growable: true).obs;
  var onWait = false.obs;

  getAllProducts() async {
    onWait.value = true;
    var response = await _request.send("products/", Request.GET, sendToken: false);
    if(response.statusCode == HttpStatus.ok) {
      (jsonDecode(response.body) as List).forEach((element) {
        products.add(Product.fromJson(element));
      });
      log(products.toString(), name: "Response Body");
    } else log(response.body, name: "Error on get products");
    onWait.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }
}