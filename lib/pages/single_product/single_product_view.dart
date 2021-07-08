import 'package:carousel_slider/carousel_slider.dart';
import 'package:enstrurent/pages/single_product/single_product_controller.dart';
import 'package:enstrurent/widgets/index.dart' as w;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProductView extends StatelessWidget {
  final SingleProductController _controller =
      Get.put(SingleProductController());

  SingleProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
          title: Text(_controller.productName,
              style:
                  Get.theme.appBarTheme.titleTextStyle!.copyWith(fontSize: 20)),
          centerTitle: true),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 12),
          child: Column(
            children: [
              CarouselSlider(
                  items: _controller.photoCards,
                  options: CarouselOptions(
                    aspectRatio: 4 / 3,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayCurve: Curves.easeInBack,
                  )),
              productInformation(),
              Visibility(
                visible: _controller.product.isRental,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      w.ProfileRow(
                          flexIt: false,
                          headline: "GÜNLÜK KİRA ÜCRETİ",
                          text: "${_controller.product.dailyPrice} ₺"),
                      w.ProfileRow(
                          flexIt: false,
                          headline: "DEPOZİTO ÜCRETİ",
                          text: "${_controller.product.depositPrice} ₺")
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: _controller.product.isOpenToSell,
                  child: w.ProfileRow(
                    headline: "Satış Fiyatı",
                    text: "${_controller.product.fullPrice}",
                  )),
            ],
          ),
        ),
      ),
      bottomSheet: Visibility(
        visible: !_controller.renterPreview,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Get.theme.appBarTheme.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: _controller.product.isOpenToSell,
                child: w.Button(
                    buttonColor: Get.theme.accentColor,
                    onClick: _controller.purchaseProductClick,
                    text: "Satın Al"),
              ),
              Visibility(
                  visible: _controller.product.isRental &&
                      _controller.product.isOpenToSell,
                  child: SizedBox(
                    width: 30,
                  )),
              Visibility(
                visible: _controller.product.isRental,
                child: w.Button(
                    buttonColor: Get.theme.primaryColor,
                    onClick: _controller.rentProductClick,
                    text: "KİRALA"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget productInformation() => Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: TextFormField(
          readOnly: true,
          controller: TextEditingController(text: _controller.product.info),
          cursorColor: Get.theme.primaryColor,
          style: Get.textTheme.bodyText1!
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          maxLines: 4,
          decoration: InputDecoration(
            labelText: "Ürün Açıklaması",
            labelStyle: Get.textTheme.bodyText1!
                .copyWith(color: Get.theme.primaryColor),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            suffixIcon: Icon(CupertinoIcons.info, color: Colors.grey.shade400),
          ),
        ),
      );
}
