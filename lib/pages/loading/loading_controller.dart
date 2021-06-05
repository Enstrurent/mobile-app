import 'package:enstrurent/services/auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  Auth _auth = Auth();

  callNavigate() => SchedulerBinding.instance.addPostFrameCallback((_) {
    _navigateToPage();
  });

  _navigateToPage() async {
    var role = await _auth.checkCurrentUser();
    switch(role) {
      case Roles.CLIENT:
        Get.offNamed("/client");
        break;
      case Roles.RENTER:
        Get.offNamed("/renter");
        break;
      case Roles.GUEST:
        Get.offNamed("/guest");
        break;
      default:
        Get.offNamed("/guest");
    }

  }

}