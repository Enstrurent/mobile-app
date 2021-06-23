import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:enstrurent/pages/renter/profile/profile_controller.dart';
import 'package:enstrurent/pages/renter/profile/widgets/address_sheet.dart';
import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

part "widgets/photo_widgets.dart";

class ProfileView extends StatelessWidget {
  final ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          title:
              Text("profile".tr, style: Get.theme.appBarTheme.titleTextStyle),
          centerTitle: true,
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
                      headline: "MAĞAZA İSMİ",
                      text: _controller.renter!.store_name),
                  ProfileRow(
                      headline: "SLOGAN", text: _controller.renter!.store_info),
                  ProfileRow(headline: "ÜRÜN SAYISI", text: "2"), // FIXME
                  SizedBox(height: 30),
                  Button(
                      text: "ADRESİ GÖRÜNTÜLE",
                      onClick: () async {
                        await _controller.getAddress();
                        addressSheet();
                      },
                      buttonColor: Get.theme.primaryColor.withAlpha(440))
                ]),
              ),
      );


  Future<dynamic> addressSheet() => Get.bottomSheet(
      AddressSheet(),
      enableDrag: true);
}
