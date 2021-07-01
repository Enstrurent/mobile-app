import 'package:enstrurent/pages/renter/add_product/add_product_controller.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/product_information_controller.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInformation extends StatelessWidget {
  ProductInformationController _informationController =
  Get.put(ProductInformationController());
  AddProductController _productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 24),
        child: Form(
          key: _informationController.infoFormKey,
          child: Obx(() =>
              Column(
                children: [
                  widgets.FormField(
                      controller: _informationController.category,
                      hint: "Örn. Piyano",
                      fieldLabel: "Kategori",
                      textInputType: TextInputType.text,
                      validatorFunc: (value) =>
                      value!.isEmpty ? "empty_value_err".tr : null),
                  Obx(() =>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("El Yapımı"),
                            Switch(
                                activeColor: Get.theme.primaryColor,
                                value: _informationController.isHandmade.value,
                                onChanged: (value) =>
                                _informationController.isHandmade.value = value),
                          ],
                        ),
                      )),
                  Visibility(
                    visible: !_informationController.isHandmade.value,
                    child: widgets.FormField(
                        controller: _informationController.brand,
                        hint: "Örn. Casio",
                        fieldLabel: "Marka",
                        textInputType: TextInputType.text,
                        validatorFunc: (value) =>
                        value!.isEmpty ? "empty_value_err".tr : null),
                  ),
                  Visibility(
                    visible: !_informationController.isHandmade.value,
                    child: widgets.FormField(
                        controller: _informationController.model,
                        hint: "Örn. CTK-3200",
                        fieldLabel: "Model",
                        textInputType: TextInputType.text,
                        validatorFunc: (value) =>
                        value!.isEmpty ? "empty_value_err".tr : null),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: TextFormField(
                      validator: (value) =>
                      value!.isEmpty ? "empty_value_err".tr : null,
                      controller: _informationController.info,
                      cursorColor: Get.theme.primaryColor,
                      style: Get.textTheme.headline6,
                      maxLines: 3,
                      maxLength: 300,
                      decoration: InputDecoration(
                        labelText: "Ürün Açıklaması",
                        labelStyle: Get.textTheme.bodyText1!
                            .copyWith(color: Get.theme.primaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        suffixIcon:
                        Icon(CupertinoIcons.info, color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                  _productController.nextBackButtons(
                      backFunction: _productController.onStepCancel,
                      nextFunction: () {
                        if (_informationController.infoFormKey.currentState!
                            .validate()) {
                          _productController.setProductInformation =
                              _informationController.dataToMap();
                          _productController.onStepContinue();
                        }
                      }),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
