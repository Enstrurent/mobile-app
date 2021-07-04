import 'dart:developer';

import 'package:enstrurent/services/auth.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/services/secure_store.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  Auth _auth = Auth();
  SecureStore secure = Get.put(SecureStore(), permanent: true);
  HttpRequest request = Get.put(HttpRequest(), permanent: true);

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
