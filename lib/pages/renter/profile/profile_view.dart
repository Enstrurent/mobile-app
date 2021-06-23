import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:enstrurent/pages/renter/profile/profile_controller.dart';
import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(6),
          child: Column(children: [
            photoArea(),
            ProfileRow(headline: "MAĞAZA İSMİ", text: "Test Mağazası"),
            ProfileRow(
                headline: "SLOGAN",
                text: "En iyi müzik mağazası artık yanı başınızda"),
            ProfileRow(headline: "ÜRÜN SAYISI", text: "2"),
            SizedBox(height: 30),
            Button(
                text: "ADRESİ GÖRÜNTÜLE",
                onClick: () => {addressSheet()},
                buttonColor: Get.theme.primaryColor.withAlpha(440))
          ]),
        ),
      );

  Radius _r = Radius.circular(30);

  Future<dynamic> addressSheet() => Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Get.theme.backgroundColor,
            borderRadius: BorderRadius.only(topRight: _r, topLeft: _r)),
        child: Column(
          children: [
            Row( // ADDRESS TITLE
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30,
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 0, left: 30),
                  child: Text(
                    "MAĞAZANIN ADRESİ",
                    style: Get.textTheme.bodyText1!.copyWith(
                        fontFamily: "BebasNeue",
                        fontSize: 20,
                        letterSpacing: 2,
                        color: Get.theme.primaryColor),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.edit,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    onPressed: null)
              ],
            ),
            Divider(
              color: Get.theme.accentColor,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileRow(headline: "ŞEHİR", text: "Şehir", flexIt: false),
                ProfileRow(
                    headline: "SEMT/İLÇE", text: "Semt/ilçe", flexIt: false)
              ],
            ),
            ProfileRow(headline: "SOKAK", text: "Sokak ismi"),
            ProfileRow(headline: "ADRES SATIRI", text: "Menekşe Sitesi D Blok"),
            ProfileRow(headline: "Adres Tarifi", text: "BIM'in karşısı."),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileRow(headline: "BİNA NO", text: "ABC12", flexIt: false),
                ProfileRow(headline: "ZIP KODU", text: "00000", flexIt: false)
              ],
            ),
          ],
        ),
      ),
      enableDrag: true);
}
