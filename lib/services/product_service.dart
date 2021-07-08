import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/widgets/getx_widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ProductService {
  final HttpRequest _sender = Get.find();

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

  Future addProduct(Map<String, dynamic> data) async {
    var response =
    await _sender.send("/products", Request.POST, body: jsonEncode(data));
    if (response.statusCode == HttpStatus.ok)
      return true;
    else {
      log("${response.body} with status code: ${response.statusCode}",
          name: "Error on add product");
      return false;
    }
  }

  static Future<Product?> getOneProduct(String productID) async {
    HttpRequest request = Get.find();
    var response = await request.send("/products/$productID", Request.GET);
    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> parsedJson = jsonDecode(response.body);
      return Product.fromJson(parsedJson);
    } else {
      log("status ${response.statusCode}  body ${response.body}", name: "Error on getOneProduct");
      return null;
    }
  }

  static Future<bool> deleteProduct(String productID) async {
    HttpRequest request = Get.find();
    var response = await request.send("/products/$productID", Request.DELETE);
    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else if (response.statusCode == HttpStatus.unauthorized) {
      Auth.signOut();
      getSnackBar("error".tr, "unauth_err");
      return false;
    } else return false;

  }

  static Future updateProduct() async {}

}
