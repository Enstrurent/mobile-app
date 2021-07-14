import 'package:cached_network_image/cached_network_image.dart';
import 'package:enstrurent/pages/renter/inventory/inventory_controller.dart';
import 'package:enstrurent/pages/renter/profile/profile_controller.dart';
import 'package:enstrurent/pages/renter/profile/widgets/address_sheet.dart';
import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

part "widgets/photo_widgets.dart";

final ProfileController _controller = Get.put(ProfileController());

class ProfileView extends StatelessWidget {
  InventoryController _inventoryController = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          title:
              Text("profile".tr, style: Get.theme.appBarTheme.titleTextStyle),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(CupertinoIcons.gear_alt, color: Get.theme.canvasColor),
              onPressed: () => Get.bottomSheet(SettingsButton(),
                  barrierColor: Get.theme.backgroundColor.withOpacity(0.9))),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => Auth.signOut(),
            )
          ],
        ),
        body: _controller.renter == null
            ? SpinKitCircle(
                color: Get.theme.primaryColor,
                size: 30,
              )
            : SingleChildScrollView(
                padding: EdgeInsets.all(6),
                child: Column(children: [
                  photoArea(),
                  ProfileRow(
                      headline: "store_name".tr,
                      text: _controller.renter!.store_name),
                  ProfileRow(
                      headline: "SLOGAN", text: _controller.renter!.store_info),
                  Obx(() => ProfileRow(
                      headline: "product_count".tr,
                      text: _inventoryController.products.length.toString())),
                  SizedBox(height: 30),
                  Button(
                      text: "show_address".tr,
                      onClick: () async {
                        await _controller.getAddress();
                        addressSheet();
                      },
                      buttonColor: Get.theme.primaryColor.withAlpha(440))
                ]),
              ),
      );

  Future<dynamic> addressSheet() =>
      Get.bottomSheet(AddressSheet(), enableDrag: true);
}
