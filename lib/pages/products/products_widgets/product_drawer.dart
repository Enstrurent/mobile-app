import 'package:enstrurent/pages/guest/drawer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String selectedCity = "İstanbul";
    return Drawer(
      child: Container(
        color: Get.theme.backgroundColor,
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton( // TODO make this a sepearate view
                  value: selectedCity,
                  onChanged:(value) => selectedCity = value.toString(), // TODO Do with getx
                  hint: Text("Şehirler"),
                    items: ["İstanbul", "İzmir", "Ankara", "Adana"]
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ))
                        .toList()),
                SizedBox(height: 10, width: 10),
                GuestDrawerCard()
              ]), // FIXME: login card to bottom
        ),
      ),
    );
  }
}
