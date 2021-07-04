
import 'package:carousel_slider/carousel_slider.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/select_photo_controller.dart';
import 'package:enstrurent/widgets/getx_widgets.dart';
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
                      Get.dialog(dialogContent(
                          headline: "Uyarı: Fotoğraf yüklemediniz.",
                          backText: "GERİ DÖN",
                          nextText: "DEVAM ET",
                          backOnClick: () => Get.back(),
                          nextOnClick: () {
                            _addProductController.onStepContinue();
                            Get.back();
                          }));
                    else {
                      _addProductController.photos = _photoController.photos;
                      _addProductController.onStepContinue();
                    }
                  }))
            ],
          ),
        ),
      );
}
