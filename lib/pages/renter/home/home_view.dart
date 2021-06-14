import 'package:enstrurent/pages/renter/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
            ],
          ),
        ));
  }
}
