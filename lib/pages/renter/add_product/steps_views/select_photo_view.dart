import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/select_photo_controller.dart';
import 'package:enstrurent/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:enstrurent/pages/renter/add_product/add_product_controller.dart';

class SelectPhotoView extends StatelessWidget {
  final AddProductController _addProductController = Get.find();
  final SelectPhotoController _photoController =
      Get.put(SelectPhotoController());

  @override
  Widget build(BuildContext context) => Obx(
        () => Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CarouselSlider(
                    items: _photoController.photoCards
                        .map((element) => element)
                        .toList(),
                    options: CarouselOptions(
                      aspectRatio: _photoController.aspectRatio.value,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      autoPlay: false,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 30),
                  child:
                      _addProductController.nextBackButtons(nextFunction: () {
                    if (_photoController.photos.length == 0)
                      Get.dialog(_dialogContent());
                    else {
                      _addProductController.photos = _photoController.photos;
                      _addProductController.onStepContinue();
                    }
                  }))
            ],
          ),
        ),
      );

  Widget _dialogContent() => Card(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 320),
      color: Get.theme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Uyarı: Fotoğraf yüklemediniz.", style: Get.textTheme.bodyText1),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                  text: "GERİ DÖN",
                  onClick: () => Get.back(),
                  buttonColor: Get.theme.accentColor),
              Button(
                  text: "DEVAM ET",
                  onClick: () {
                    _addProductController.onStepContinue();
                    Get.back();
                  },
                  buttonColor: Get.theme.primaryColor)
            ],
          )
        ],
      ));
}
