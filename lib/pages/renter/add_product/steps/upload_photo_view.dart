import 'package:carousel_slider/carousel_slider.dart';
import 'package:enstrurent/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:enstrurent/pages/renter/add_product/add_product_controller.dart';

class UploadPhotoView extends StatelessWidget {
  final AddProductController _controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            CarouselSlider(
                items:
                    _controller.photoCards.map((element) => element).toList(),
                options: CarouselOptions(
                  aspectRatio: _controller.aspectRatio.value,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  autoPlay: false,
                )),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Button(text: "İLERİ  ", onClick: () {}, buttonColor: Get.theme.primaryColor),
            )
          ],
        ),
      );
}
