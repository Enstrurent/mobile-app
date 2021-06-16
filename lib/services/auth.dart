import 'dart:developer';

import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/services/secure_store.dart';
import 'package:get/get.dart';
import 'package:enstrurent/widgets/index.dart';

enum Roles { GUEST, RENTER, CLIENT }

Map<Roles, String> roleString = {
  Roles.GUEST: "guest",
  Roles.RENTER: "renter",
  Roles.CLIENT: "client"
};

class Auth {

  Future<Roles> validateCurrentUser() async {
    var secure = SecureStore();
    if (await validateToken()) {
      Roles selectedRole = Roles.GUEST;
      var role = await secure.readValue("role");
      Roles.values.forEach((element) {
        if (role == roleString[element]) selectedRole = element;
      });
      return selectedRole;
    } else
      return Roles.GUEST;
  }

  Future<bool> validateToken() async {
    HttpRequest reqSender = Get.find();
    var response = await reqSender.send("auth/validate", Request.POST);
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static navigateTo() async {
    var secure = SecureStore();
    String role = await secure.readValue("role");

    if (role == roleString[Roles.CLIENT])
      Get.offAllNamed("/client");
    else if (role == roleString[Roles.RENTER])
      Get.offNamed("/renter");
    else
      getSnackBar("error".tr, "went_wrong".tr);
  }

  static bool saveAuthToLocal(Map resBody) {
    SecureStore store = SecureStore();
    try {
      resBody.forEach((key, value) async {
        await store.writeValue(key, value);
      });
      return true;
    } catch (e) {
      log(e.toString(), name: "Error on saving credentials ");
      return false;
    }
  }
}
