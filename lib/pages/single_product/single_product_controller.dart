import 'package:enstrurent/models/product.dart';
import 'package:get/get.dart';

class SingleProductController extends GetxController {
  Map arguments = Get.arguments;
  late Product product;

  @override
  void onInit() {
    super.onInit();
    product = arguments["product"];
  }
}