import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStore extends GetxController {
  FlutterSecureStorage storage = new FlutterSecureStorage();

  Future<dynamic> readValue(String key) async {
    return await storage.read(key: key);
  }

  writeValue(String key, dynamic value) async {
    return await storage.write(key: key, value: value);
  }

  resetAll() async {
    await storage.deleteAll();
  }
}