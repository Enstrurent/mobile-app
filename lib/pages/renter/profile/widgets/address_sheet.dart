import 'package:enstrurent/pages/renter/profile/profile_controller.dart';
import 'package:enstrurent/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressSheet extends StatelessWidget {
  final ProfileController _controller = Get.find();
  final Radius _r = Radius.circular(30);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Get.theme.backgroundColor,
          borderRadius: BorderRadius.only(topRight: _r, topLeft: _r)),
      child: Column(
        children: [
          Row(
            // ADDRESS TITLE
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
              ProfileRow(
                  headline: "ŞEHİR",
                  text: _controller.renterAddress!.city,
                  flexIt: false),
              ProfileRow(
                  headline: "SEMT/İLÇE",
                  text: _controller.renterAddress!.state,
                  flexIt: false)
            ],
          ),
          ProfileRow(
              headline: "SOKAK", text: _controller.renterAddress!.street!),
          ProfileRow(
              headline: "ADRES SATIRI",
              text: _controller.renterAddress!.address_line!),
          ProfileRow(
              headline: "Adres Tarifi",
              text: _controller.renterAddress!.description!),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileRow(
                  headline: "BİNA NO",
                  text: _controller.renterAddress!.building_no!,
                  flexIt: false),
              ProfileRow(
                  headline: "ZIP KODU",
                  text: _controller.renterAddress!.zipcode!,
                  flexIt: false)
            ],
          ),
        ],
      ),
    );
  }
}
