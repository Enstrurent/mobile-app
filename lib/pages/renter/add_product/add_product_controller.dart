import 'dart:developer';
import 'dart:io';
import 'package:enstrurent/config/themes.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  StepperType stepperType = StepperType.horizontal;
  var currentStep = 0.obs;
  Map<String, dynamic> _productInformation = {};

  List<File>? _photos = List.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
  }

  set photos(RxList<File> list) =>
    _photos = list.toList();

  set setProductInformation(Map<String, dynamic> data) {
    _productInformation.addAll(data);
    log(_productInformation.toString());
  }

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

  Widget nextBackButtons(
          {VoidCallback? backFunction,
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
}
