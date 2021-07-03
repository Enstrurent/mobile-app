import 'dart:io';

import 'package:enstrurent/services/http_request.dart';
import 'package:enstrurent/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart' as dio;

class PhotoService {
  static const int mb2bytes = 1048576;
  final HttpRequest _sender = Get.find();

  Future<dio.Response?> uploadPhotos(List<File> photos) async {
    List<dio.MultipartFile> dioPhotos = [];
    for (var entry in photos.asMap().entries) {
      var fileSizeMB = entry.value.lengthSync() / mb2bytes;
      ImageProperties properties =
          await FlutterNativeImage.getImageProperties(entry.value.path);
      File compressedFile = await FlutterNativeImage.compressImage(
          entry.value.path,
          quality: fileSizeMB <= 2 ? 100 : 70,
          targetWidth:
              properties.width! > 1920 ? (properties.width! / 2).round() : 0,
          targetHeight:
              properties.height! > 1080 ? (properties.height! / 2).round() : 0);
      dioPhotos.add(await dio.MultipartFile.fromFile(compressedFile.path,
          filename: "photo${entry.key}.jpg",
          contentType: MediaType("image", "jpg")));
    }
    var formBody = dio.FormData.fromMap({"images": dioPhotos});
    return _sender.sendFormData("/images", formBody);
  }

  Future<dio.Response?> uploadSinglePhoto(File file,
      {bool isThumbnail = true}) async {
    List<dio.MultipartFile> dioPhotos = [];

    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(file.path);
    file = await FlutterNativeImage.compressImage(file.path,
        quality: 70,
        targetWidth: isThumbnail ? 300 : 0,
        targetHeight: isThumbnail
            ? (properties.height! * 300 / properties.width!).round()
            : 0);
    dioPhotos.add(await dio.MultipartFile.fromFile(file.path,
        filename: "thumbnail.jpg", contentType: MediaType("image", "jpg")));
    return _sender.sendFormData(
        "/images", dio.FormData.fromMap({"images": dioPhotos}));
  }

  static Future<File?> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      var file = File(pickedFile.path);
      return file;
    } else {
      Get.snackbar("Warning", "Image not selected",
          backgroundColor: Get.theme.backgroundColor,
          colorText: Get.theme.primaryColor);
      return null;
    }
  }

  static Future<dynamic> getSelectionDialog() async {
    File? file;
    await Get.dialog(
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  icon: Icon(CupertinoIcons.camera),
                  text: "Kamera",
                  onClick: () async {
                    file = await PhotoService.getImage(ImageSource.camera);
                    Get.back();
                  },
                  buttonColor: Get.theme.accentColor.withAlpha(200)),
              SizedBox(
                width: 20,
              ),
              Button(
                  icon: Icon(CupertinoIcons.photo_fill_on_rectangle_fill),
                  text: "Dahili Depolama",
                  onClick: () async {
                    file = await PhotoService.getImage(ImageSource.gallery);
                    Get.back();
                  },
                  buttonColor: Get.theme.accentColor.withAlpha(200)),
            ],
          ),
        ),
        useSafeArea: false,
        transitionCurve: Curves.easeIn,
        transitionDuration: Duration(seconds: 1),
        barrierColor: Get.theme.accentColor.withOpacity(0.3));
    return new Future<dynamic>.value(file);
  }

  static Future<double> getAspectRatio(File file) async {
    var properties = await FlutterNativeImage.getImageProperties(file.path);
    return properties.width! / properties.height!;
  }
}
