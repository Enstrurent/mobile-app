import 'package:enstrurent/pages/guest/drawer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Get.theme.backgroundColor,
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10, width: 10),
                GuestDrawerCard()
              ]), // FIXME: login card to bottom
        ),
      ),
    );
  }
}
