import 'dart:convert';
import 'dart:developer';

import 'package:enstrurent/models/order_base.dart';
import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/models/purchase_order.dart';
import 'package:enstrurent/models/rent_order.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/services/product_service.dart';
import 'package:enstrurent/widgets/getx_widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class OrdersController extends GetxController {
  HttpRequest _sender = Get.find();
  RxList<OrderBase> orders = RxList();

  @override
  onInit() {
    super.onInit();
    getOrders();
  }

  showTheProduct(OrderBase order) async {
    var response =
        await _sender.send("products/${order.product_id}", Request.GET);
    if (response.statusCode == HttpStatus.ok) {
      Product product = Product.fromJson(jsonDecode(response.body));
      Get.toNamed("/single_product",
          arguments: {"product": product, "renterPreview": true});
    }
  }

  productPreview(String productID) async {
    var product =
    await ProductService.getOneProduct(productID);
    if (product is Product)
      Get.toNamed("/single_product",
          arguments: {"product": product, "renterPreview": true});
    else getSnackBar("error".tr, "product_not_found_err".tr);
  }

  Future<void> getOrders() async {
    var response = await _sender.send("/orders", Request.GET);
    if (response.statusCode == HttpStatus.ok) {

      List<dynamic>? data = jsonDecode(response.body);
      if (data != null) {
        orders.clear();
        for (Map<String, dynamic> singleOrder in data) {
          if (singleOrder.containsKey("renting_price")) {
            orders.add(RentOrder.fromJson(singleOrder));
          } else {
            orders.add(PurchaseOrder.fromJson(singleOrder));
          }
        }
        orders.value = List.from(orders.reversed);
      } else {
        log("Data is null", name: "Get Orders Error");
      }
      update();
    } else {
      log("status code: ${response.statusCode}, body: ${response.body}, url ${response.request!.url}",
          name: "Error on getOrders");
      getSnackBar("error".tr, "went_wrong".tr);
    }
  }
}
