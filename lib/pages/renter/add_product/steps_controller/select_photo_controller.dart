import 'dart:developer';
import 'dart:io';

import 'package:enstrurent/pages/renter/add_product/widgets/photo_card.dart';
import 'package:enstrurent/services/photo_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPhotoController extends GetxController {

  RxList<File> photos = RxList<File>();
  RxList<Widget> photoCards = RxList<Widget>();
  var singleFile;
  Widget? emptyPhotoCard;
  var aspectRatio = (4 / 3).obs;

  @override
  void onInit() {
    super.onInit();
    emptyPhotoCard = PhotoCard(getImageFunc: emptyCardFunction);
    photoCards.add(emptyPhotoCard!);
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

  PhotoCard createPhotoCard(File file) =>
      PhotoCard(image: file, deleteFunc: createDeleteFunction(file.path));

  VoidCallback createDeleteFunction(String filePath) {
    return () {
      String path = filePath;
      log(path, name: "PATH");
      photos.removeWhere((element) => element.path == path);
      if (photos.length == 0) aspectRatio.value = 4/3;
      photoCards.clear();
      photoCards.addAll(photos.map((element) => createPhotoCard(element)));
      photoCards.add(emptyPhotoCard!);
      update();
    };
  }

}