import 'dart:developer';

import 'package:enstrurent/services/auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  Auth _auth = Auth();

  callNavigate() => SchedulerBinding.instance!.addPostFrameCallback((_) {
        _navigateToPage();
      });

  _navigateToPage() async {
    var role = await _auth.validateCurrentUser();
    log(role.toString(), name: "Role");
    roleString.forEach((key, value) {
      if (role == key) Get.offNamed("/$value");
    });
  }
}
