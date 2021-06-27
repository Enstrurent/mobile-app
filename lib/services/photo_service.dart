import 'dart:developer';
import 'dart:io';

import 'package:enstrurent/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoService {
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
