import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:enstrurent/pages/renter/add_product/add_product_view.dart';

class RenterHomeController extends GetxController {
  List<String> menuNames = ["inventory".tr, "add_product".tr, "profile".tr];
  late List<BottomNavigationBarItem> renterNavItems;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 1).obs;
    renterNavItems = [
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cube_box), label: menuNames[0]),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled), label: menuNames[1]),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: menuNames[2])
    ];
  }

  Widget createNavbar(List<BottomNavigationBarItem> navbarItems) => ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
          currentIndex: getSelectedIndex,
          items: navbarItems,
          onTap: onItemTapped,
          backgroundColor: Get.theme.bottomNavigationBarTheme.backgroundColor,
          unselectedItemColor: Get.theme.accentColor,
          selectedItemColor: Get.theme.primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 28));

  Widget createTestObj(String title) =>
      Container(child: Center(child: Text(title)));
  var selectedIndex = 0.obs;
  late Rx<PageController> pageController;
  List<Widget> tabs = [];

  onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }

  int get getSelectedIndex => selectedIndex.value;
  String get currentMenuName => menuNames[selectedIndex.value];

}
