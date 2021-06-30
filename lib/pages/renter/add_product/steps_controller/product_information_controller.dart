import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductInformationController extends GetxController {
  TextEditingController category = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController info = TextEditingController();
  final infoFormKey = GlobalKey<FormState>();

  Map<String, String> dataToMap() => {
        "category": category.text.trim(),
        "brand": brand.text.trim(),
        "model": model.text.trim(),
        "info": info.text.trim()
      };
}
