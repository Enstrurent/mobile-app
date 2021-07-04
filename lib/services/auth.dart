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
    SecureStore secure = Get.find();

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

  static Future<bool> validateToken() async {
    HttpRequest reqSender = Get.find();
    var response = await reqSender.send("auth/validate", Request.POST);
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<bool> validateClient() async {
    SecureStore secure = Get.find();
    if (await secure.readValue("token") is String &&
        await secure.readValue("role") == roleString[Roles.CLIENT])
      return true;
    else
      return false;
  }

  static navigateTo() async {
    SecureStore secure = Get.find();
    dynamic role = await secure.readValue("role");

    role != null
        ? Get.offAllNamed("/${role.toString()}")
        : getSnackBar("error".tr, "went_wrong".tr);
  }

  static bool saveAuthToLocal(Map resBody) {
    SecureStore store = Get.find();
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

  static signOut() {
    SecureStore _store = Get.find();
    _store.resetAll();
    Get.offAllNamed("/");
  }
}
