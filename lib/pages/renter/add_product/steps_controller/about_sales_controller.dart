import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutSalesController extends GetxController {
  RxBool isForRent = false.obs;
  RxBool isForSale = false.obs;
  RxBool isDepositRequired = false.obs;
  RxBool isUsed = false.obs;
  final salesFormKey = GlobalKey<FormState>();

  TextEditingController rentalPrice = TextEditingController();
  TextEditingController salePrice = TextEditingController();
  TextEditingController depositPrice = TextEditingController();
  TextEditingController maxRentalDays = TextEditingController();
  TextEditingController stockCount = TextEditingController();

  resetValues () {
    isForRent.value = false;
    isForSale.value = false;
    isDepositRequired.value = false;
    isUsed.value = false;
    salesFormKey.currentState?.reset();
    rentalPrice.text = "";
    salePrice.text = "";
    depositPrice.text = "";
    maxRentalDays.text = "";
    stockCount.text = "";
  }
  get validation =>
      salesFormKey.currentState!.validate() &&
      (isForSale.value || isForRent.value);

  Map<String, dynamic> dataToMap() => {
    "is_rental": isForRent.value,
    "is_deposit_required": isDepositRequired.value,
    "is_open_to_sell": isForSale.value,
    "is_used": isForSale.value ? isUsed.value : false,
    "max_rental_days": isForRent.value? int.parse(maxRentalDays.text.trim()) :  0,
    "daily_price": isForRent.value? double.parse(rentalPrice.text.trim()) : 0,
    "full_price":isForSale.value? double.parse(salePrice.text.trim()): 0,
    "deposit_price": isDepositRequired.value? double.parse(depositPrice.text.trim()) : 0,
    "stock_quantity": isForSale.value? int.parse(stockCount.text.trim()) : 0,
  };
}
