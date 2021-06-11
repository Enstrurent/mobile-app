import 'package:enstrurent/pages/guest/home/home_controller.dart';
import 'package:enstrurent/pages/products/products_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenterHome extends StatelessWidget {
  // Fikir: Guest -> Sadece enstrümanlar, diğer rollere göre bottom nav değişsin.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              ProductsView(),
              controller.createTestObj("No 2"),
              controller.createTestObj("No 3")
            ],
          ),
        ));
  }
}
