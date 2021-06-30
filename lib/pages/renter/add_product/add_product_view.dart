import 'package:enstrurent/config/themes.dart';
import 'package:enstrurent/pages/renter/add_product/add_product_controller.dart';
import 'package:enstrurent/pages/renter/add_product/steps_views/product_information_view.dart';
import 'package:enstrurent/pages/renter/add_product/steps_views/about_sales_view.dart';
import 'package:enstrurent/pages/renter/add_product/steps_views/confirm_view.dart';
import 'package:enstrurent/pages/renter/add_product/steps_views/select_photo_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';

class AddProductView extends StatelessWidget {
  final AddProductController _controller = Get.find();
  Map<int, Widget> steps = {
    0: SelectPhotoView(),
    1: ProductInformation(),
    2: AboutSales(),
    3: ConfirmView()
  };

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          title: Text("add_product".tr,
              style: Get.theme.appBarTheme.titleTextStyle),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Themes.darkerBackground.withOpacity(0.3),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Obx(() => Text(
                      _controller.stepperTitle(),
                      style: Get.textTheme.bodyText1!.copyWith(
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Obx(
              () => IconStepper(
                  steppingEnabled:  true,
                  activeStepColor: Get.theme.primaryColor,
                  activeStepBorderColor: Get.theme.accentColor,
                  alignment: Alignment.topCenter,
                  activeStep: _controller.currentStep.value,
                  onStepReached: _controller.onStepTapped,
                  lineColor: Get.theme.primaryColor,
                  nextButtonIcon: Icon(CupertinoIcons.chevron_right),
                  previousButtonIcon: Icon(CupertinoIcons.left_chevron),
                  stepColor: Get.theme.backgroundColor,
                  stepReachedAnimationEffect: Curves.easeIn,
                  stepReachedAnimationDuration:
                      Duration(seconds: 1, milliseconds: 500),
                  icons: [
                    Icon(CupertinoIcons.camera),
                    Icon(CupertinoIcons.info_circle),
                    Icon(CupertinoIcons.money_dollar),
                    Icon(CupertinoIcons.checkmark_circle),
                  ]),
            ),
            Expanded(child: Obx(() => steps[_controller.currentStep]!))
          ],
        ),
      );
}
