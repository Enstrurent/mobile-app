import 'dart:developer';

import 'package:enstrurent/config/themes.dart';
import 'package:enstrurent/pages/renter/add_product/add_product_controller.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/confirm_controller.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmView extends StatelessWidget {
  ConfirmController _confirmController = Get.put(ConfirmController());
  AddProductController _productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: widgets.DropdownChips(
                dropdownHint: "select_delivery_types".tr,
                dropdownItems: _confirmController.deliveryTypes,
                observableList: _confirmController.selectedDeliveryTypes),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: widgets.DropdownChips(
                dropdownHint: "Etiketler",
                dropdownItems: _confirmController.tags,
                observableList: _confirmController.selectedTags),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: widgets.DropdownChips(
                dropdownHint: "Ödeme Yöntemleri",
                dropdownItems: _confirmController.paymentMethods,
                observableList: _confirmController.selectedPaymentMethods),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Taslak olarak kaydet:"),
            Obx(
              () => Switch(
                  activeColor: Get.theme.primaryColor,
                  value: _confirmController.isDraft.value,
                  onChanged: (value) =>
                      _confirmController.isDraft.value = value),
            )
          ]),

          Padding(
            padding: EdgeInsets.only(top: 30),
            child: _productController.nextBackButtons(
                backFunction: () => _productController.onStepCancel(),
                nextFunction: () {
                  var data = _confirmController.confirmAndGiveData();
                  if (data != null) _productController.setProductInformation = data;
                },
                next: "confirm".tr,
                nextIcon: Icon(CupertinoIcons.checkmark_circle)
            ),
          ),
        ],
      ),
    );
  }
}
