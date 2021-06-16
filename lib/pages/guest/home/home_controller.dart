import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {

  List<BottomNavigationBarItem> clientNavItems = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.guitars), label: "Enstrümanlar"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: "Sepet"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: "Profil"),
  ];


  Widget createNavbar(List<BottomNavigationBarItem> navbarItems) => ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
          currentIndex: getSelectedIndex,
          items: navbarItems,
          onTap: onItemTapped,
          backgroundColor: Get.theme.backgroundColor,
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
    print("$index  ${selectedIndex.value}");
    update();
  }

  int get getSelectedIndex => selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 1).obs;
  }
}
