import 'dart:developer';
import 'dart:io';

import 'package:enstrurent/pages/renter/add_product/widgets/photo_card.dart';
import 'package:enstrurent/services/photo_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  StepperType stepperType = StepperType.horizontal;
  var currentStep = 0.obs;
  var singleFile;
  Widget? emptyPhotoCard;
  var aspectRatio = (4 / 3).obs;

  RxList<File> photos = RxList<File>();
  RxList<Widget> photoCards = RxList<Widget>();

  @override
  void onInit() {
    super.onInit();
    emptyPhotoCard = PhotoCard(getImageFunc: emptyCardFunction);
    photoCards.add(emptyPhotoCard!);
  }

  void onStepTapped(int value) => currentStep.value = value;

  void onStepCancel() => currentStep.value--;

  void onStepContinue() => currentStep.value++;

  PhotoCard createPhotoCard(File file) =>
      PhotoCard(image: file, deleteFunc: createDeleteFunction(file.path));

  VoidCallback createDeleteFunction(String filePath) {
    return () {
      String path = filePath;
      log(path, name: "PATH");
      photos.removeWhere((element) => element.path == path);
      photoCards.clear();
      photoCards.addAll(photos.map((element) => createPhotoCard(element)));
      photoCards.add(emptyPhotoCard!);
      update();
    };
  }

  emptyCardFunction() async {
    singleFile = await PhotoService.getSelectionDialog();
    if (singleFile is File) {
      photos.add(singleFile!);
      PhotoCard currentCard = createPhotoCard(singleFile);
      photoCards.insert(photos.length - 1, currentCard);
      singleFile = null;
      if (photos.length >= 4) photoCards.remove(emptyPhotoCard);
      if (photos.length == 1)
        aspectRatio.value = await PhotoService.getAspectRatio(photos[0]);
      update();
    } else
      log("singleFile var is null", name: "On empty card function");
  }

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
}
