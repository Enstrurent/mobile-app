import 'dart:convert';
import 'dart:developer';

import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ProductService {
  static Future<List<Product>> getProducts(
      {String uri = "products", bool isToken = false}) async {

    HttpRequest _request = Get.find();
    List<Product> products = List.empty(growable: true);
    var response = await _request.send(uri, Request.GET, sendToken: isToken);
    if (response.statusCode == HttpStatus.ok) {
      (jsonDecode(response.body) as List).forEach((element) {
        products.add(Product.fromJson(element));
      });
    } else
      log(response.body, name: "Error on get products");
    return products;
  }


}
