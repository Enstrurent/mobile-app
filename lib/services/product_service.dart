import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:enstrurent/models/product.dart';
import 'package:enstrurent/services/http_request.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';

class ProductService {
  static const int mb2bytes = 1048576;
  final HttpRequest _sender = Get.find();


  static Future<List<Product>> getProducts(
      {String uri = "products", bool isToken = false}) async {
    HttpRequest _request = Get.find();
    List<Product> products = List.empty(growable: true);
    var response = await _request.send(uri, Request.GET, sendToken: isToken);
    if (response.statusCode == HttpStatus.ok) {
      (jsonDecode(response.body) as List).forEach((element) {
        products.add(Product.fromJson(element));
      });
    } else
      log(response.body, name: "Error on get products");
    return products;
  }

  Future addProduct() async {}

  static Future deleteProduct() async {}

  static Future updateProduct() async {}

  Future uploadPhotos(List<File> photos) async {
    List<dio.MultipartFile> dioPhotos = [];
    for (var entry in photos.asMap().entries) {
      var fileSizeMB = entry.value.lengthSync() / mb2bytes;
      ImageProperties properties =
          await FlutterNativeImage.getImageProperties(entry.value.path);
      File compressedFile = await FlutterNativeImage.compressImage(
          entry.value.path,
          quality: fileSizeMB < 2 ? 90 : 50,
          targetWidth: properties.height! > 1920 ? properties.height! ~/ 2 : 0,
          targetHeight:
              properties.height! > 1080 ? properties.height! ~/ 2 : 0);
      log(properties.height.toString(), name: "Input file properties");
      var last =
          await FlutterNativeImage.getImageProperties(compressedFile.path);
      log(last.height.toString() + " " + last.width.toString(),
          name: "Output image");
      dioPhotos.add(await dio.MultipartFile.fromFile(compressedFile.path,
          filename: "photo${entry.key}.jpg",
          contentType: MediaType("image", "jpg")));
    }
    var formBody = dio.FormData.fromMap({"images": dioPhotos});
    _sender.sendFormData("images", formBody);
  }

  createThumbnailPhoto(File thumbnail) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(thumbnail.path);
    thumbnail = await FlutterNativeImage.compressImage(thumbnail.path,
        quality: 70,
        targetWidth: 300,
        targetHeight: (properties.height! * 600 / properties.width!).round());
  }
}
