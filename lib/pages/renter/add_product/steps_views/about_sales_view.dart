import 'package:enstrurent/pages/renter/add_product/add_product_controller.dart';
import 'package:enstrurent/pages/renter/add_product/steps_controller/about_sales_controller.dart';
import 'package:enstrurent/widgets/index.dart' as widgets;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutSales extends StatelessWidget {
  AboutSalesController _salesController = Get.put(AboutSalesController());
  AddProductController _productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _salesController.salesFormKey,
        child: Obx(
          () => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Kiraya ver: "),
                  Switch(
                      activeColor: Get.theme.primaryColor,
                      value: _salesController.isForRent.value,
                      onChanged: (value) =>
                          _salesController.isForRent.value = value),
                ],
              ),
              _salesController.isForRent.value
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: widgets.FormField(
                              fieldLabel: "Günlük Kira Ücreti (₺)",
                              hint: "Örn. 60.5",
                              controller: _salesController.rentalPrice,
                              textInputType: TextInputType.number,
                              validatorFunc: (value) =>
                                  double.tryParse(value!) == null
                                      ? "invalid_value_err".tr
                                      : null),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: widgets.FormField(
                              fieldLabel: "Maksimum Kiralanabilen Gün Sayısı",
                              hint: "Örn. 20",
                              controller: _salesController.maxRentalDays,
                              textInputType: TextInputType.number,
                              validatorFunc: (value) =>
                                  int.tryParse(value!) == null
                                      ? "invalid_value_err".tr
                                      : null),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Depozito:"),
                              Switch(
                                  activeColor: Get.theme.primaryColor,
                                  value:
                                      _salesController.isDepositRequired.value,
                                  onChanged: (value) => _salesController
                                      .isDepositRequired.value = value)
                            ]),
                        _salesController.isDepositRequired.value
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: widgets.FormField(
                                    fieldLabel: "Depozito Ücreti (₺)",
                                    hint: "Örn. 500.5",
                                    controller: _salesController.depositPrice,
                                    textInputType: TextInputType.number,
                                    validatorFunc: (value) =>
                                        double.tryParse(value!) == null
                                            ? "invalid_value_err".tr
                                            : null),
                              )
                            : Container(width: 0, height: 0)
                      ],
                    )
                  : Container(width: 0, height: 0),
              Divider(height: 30, thickness: 3, endIndent: 20, indent: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Satışa çıkar: "),
                  Switch(
                      activeColor: Get.theme.primaryColor,
                      value: _salesController.isForSale.value,
                      onChanged: (value) =>
                          _salesController.isForSale.value = value),
                ],
              ),
              _salesController.isForSale.value
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("2.el mi?"),
                            Switch(
                                activeColor: Get.theme.primaryColor,
                                value: _salesController.isUsed.value,
                                onChanged: (value) =>
                                _salesController.isUsed.value = value),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: widgets.FormField(
                              fieldLabel: "Satış Fiyatı (₺)",
                              hint: "Örn. 800",
                              controller: _salesController.salePrice,
                              textInputType: TextInputType.number,
                              validatorFunc: (value) =>
                                  double.tryParse(value!) == null
                                      ? "invalid_value_err".tr
                                      : null),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: widgets.FormField(
                              fieldLabel: "Stok Miktarı",
                              hint: "Örn. 10",
                              controller: _salesController.stockCount,
                              textInputType: TextInputType.number,
                              validatorFunc: (value) =>
                                  int.tryParse(value!.trim()) == null
                                      ? "invalid_value_err".tr
                                      : null),
                        ),

                      ],
                    )
                  : Container(width: 0, height: 0),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: _productController.nextBackButtons(
                    backFunction:() => _productController.onStepCancel(),
                    nextFunction: () {
                      if(_salesController.validation) {
                        _productController.setProductInformation = _salesController.dataToMap();
                        _productController.onStepContinue();
                      } else widgets.getSnackBar("error".tr, "Geçersiz işlem");
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
