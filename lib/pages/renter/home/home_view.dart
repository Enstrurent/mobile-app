import 'package:enstrurent/pages/renter/add_product/add_product_view.dart';
import 'package:enstrurent/pages/renter/home/home_controller.dart';
import 'package:enstrurent/pages/renter/inventory/inventory_view.dart';
import 'package:enstrurent/pages/renter/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenterHome extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (controller) => Scaffold(
          backgroundColor: Get.theme.backgroundColor,
          body: Obx(() => IndexedStack(
              index: _controller.selectedIndex.value,
              children: [
                InventoryView(),
                AddProductView(),
                ProfileView()
              ],
            ),
          ),
          bottomNavigationBar: Obx(() => _controller.createNavbar(_controller.renterNavItems)),
        ),
    );
  }
}
