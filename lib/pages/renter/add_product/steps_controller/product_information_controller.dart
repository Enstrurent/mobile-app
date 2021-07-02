import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductInformationController extends GetxController {
  TextEditingController category = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController info = TextEditingController();
  final infoFormKey = GlobalKey<FormState>();
  RxBool isHandmade = false.obs;

  void resetValues() {
    isHandmade.value = false;
    infoFormKey.currentState?.reset();
    category.text = "";
    brand.text = "";
    model.text = "";
    info.text = "";
  }

  set isHandMade(bool value) {
    if(value) {
      brand.text = "El yapımı";
      model.text = category.text;
    }
  }

  Map<String, String> dataToMap() => {
        "category": category.text.trim(),
        "brand": brand.text.trim(),
        "model": model.text.trim(),
        "info": info.text.trim()
      };

}
