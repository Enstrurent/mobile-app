import 'dart:developer';
import 'dart:io';
import 'package:enstrurent/config/themes.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/about_sales_controller.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/confirm_controller.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/product_information_controller.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/select_photo_controller.dart';
import 'package:enstrurent/services/photo_service.dart';
import 'package:enstrurent/services/product_service.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  StepperType stepperType = StepperType.horizontal;
  var currentStep = 0.obs;
  Map<String, dynamic> _productInformation = {};
  ProductService productService = ProductService();
  RxBool onConfirm = false.obs;

  List<File>? _photos = List.empty(growable: true);

  resetValues() {
    AboutSalesController salesController = Get.find();
    ConfirmController confirmController = Get.find();
    ProductInformationController informationController = Get.find();
    SelectPhotoController photoController = Get.find();

    photoController.resetValues();
    informationController.resetValues();
    confirmController.resetValues();
    salesController.resetValues();
    currentStep.value = 0;
    _productInformation.clear();
    _photos?.clear();
    onConfirm.value = false;
    update();
  }

  set photos(RxList<File> list) => _photos = list.toList();

  set setProductInformation(Map<String, dynamic> data) =>
      _productInformation.addAll(data);

  void onStepTapped(int value) => currentStep.value = value;

  void onStepCancel() => currentStep.value--;

  void onStepContinue() => currentStep.value++;

  String stepperTitle() {
    switch (currentStep.value) {
      case 0:
        return "Fotoğrafları Yükle";
      case 1:
        return "Ürün Bilgileri";
      case 2:
        return "Satış Tipleri";
      case 3:
        return "Onay";
      default:
        return "";
    }
  }

  Widget nextBackButtons({VoidCallback? backFunction,
    VoidCallback? nextFunction,
    String next = "İLERİ",
    Icon? nextIcon}) =>
      Padding(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backFunction != null
                ? widgets.Button(
                text: "GERİ",
                onClick: backFunction,
                buttonColor: Get.theme.accentColor)
                : SizedBox(height: 10, width: 110),
            nextFunction != null
                ? widgets.Button(
                icon: nextIcon,
                text: next,
                onClick: nextFunction,
                buttonColor: Themes.darkerPrimary)
                : SizedBox(height: 10, width: 110)
          ],
        ),
      );

  addProductRequest() async {
    onConfirm.value = true;
    PhotoService photoService = PhotoService();
    if (_photos != null || _photos!.isNotEmpty) {
      try {
        var response = await photoService.uploadPhotos(_photos!);
        List<String> imageNames = List.castFrom(response!.data["image_names"]);
        _productInformation["image_names"] = imageNames;

        response = await photoService.uploadSinglePhoto(_photos![0]);
        _productInformation["thumbnail_names"] =
            List.castFrom(response!.data["image_names"]);
      } catch (e, stackTrace) {
        log(e.toString() + " ${stackTrace.toString()}",
            name: "error on posting photos");
        widgets.getSnackBar("error".tr,
            "went_wrong".tr);
      }
    }

    log(_productInformation.toString());
    bool success = await productService.addProduct(_productInformation);
    if (success) {
      widgets.getSnackBar("Başarılı!", "Ürün başarılı bir şekilde listelendi");
      resetValues();
    } else {
      widgets.getSnackBar("error".tr,
          "went_wrong".tr);
    }
    onConfirm.value = false;
  }


  List getImageNames(dynamic data) => data["image_names"] as List;
}
