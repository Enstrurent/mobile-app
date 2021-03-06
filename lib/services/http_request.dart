import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:enstrurent/services/secure_store.dart';

enum Request { POST, GET, DELETE, PUT }

class HttpRequest extends GetxController {
  SecureStore _store = Get.find();
  static String host = "***REMOVED***";
  var dioObj = dio.Dio(); //  For sending multipart files with form-data.
  String token = "";
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  }; // TODO: add app key to headers

  HttpRequest() {
    dioObj.options.baseUrl = "https://$host";
  }
  String get hostName => "https://$host";

  static String get imageBaseUrl => "https://$host/images/";

  Future<bool> _putTokenToHeaders() async {
    if (token == "") {
      var temp = await _store.readValue("token");
      if (temp != null)
        token = temp;
      else
        return false;
    }
    headers.putIfAbsent("token", () => token);
    return true;
  }

  Future<http.Response> send(String uri, Request type,
      {bool sendToken: true, dynamic body}) async {
    if (sendToken) {
      if (!await _putTokenToHeaders()) // If token doesn't exist create a response for status 401 (unauthorized)
        return http.Response("Internal response: Token unavailable.", 401);
    }
    Uri url = Uri.https(host, uri);
    switch (type) {
      case Request.POST:
        return await http.post(url,
            headers: sendToken
                ? headers
                : {'Content-Type': 'application/json; charset=UTF-8'},
            body: body);
      case Request.PUT:
        return await http.put(url, body: body, headers: headers);
      case Request.GET:
        return await http.get(url, headers: headers);
      case Request.DELETE:
        return await http.delete(url, headers: headers);
      default:
        return http.Response("ERROR", 403);
    }
  }

  Future<dio.Response?> sendFormData(String uri, dynamic body) async {
    await _putTokenToHeaders();
    try {
      var response = await dioObj.post(uri,
          data: body, options: dio.Options(headers: headers));
      return response;
    } on dio.DioError catch (e, stackTrace) {
      log("Dio error: ${e.message}, stack trace: ${stackTrace.toString()}");
      return null;
    }
  }
}
