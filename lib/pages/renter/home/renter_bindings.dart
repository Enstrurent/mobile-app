import 'package:enstrurent/pages/renter/add_product/add_product_controller.dart';
import 'package:enstrurent/pages/renter/home/renter_home_controller.dart';
import 'package:enstrurent/pages/renter/inventory/inventory_controller.dart';
import 'package:enstrurent/pages/renter/profile/profile_controller.dart';
import 'package:get/get.dart';

class RenterBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => RenterHomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => AddProductController());
    Get.lazyPut(() => InventoryController());
  }
}