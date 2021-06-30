import 'dart:developer';
import 'dart:io';
import 'package:enstrurent/config/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoCard extends StatelessWidget {
  // Images in add product tab.
  final File? image;
  final VoidCallback? getImageFunc;
  final VoidCallback? deleteFunc;

  PhotoCard({Key? key, this.image, this.getImageFunc, this.deleteFunc})
      : super(key: key) {
    if (this.deleteFunc == null) {
      log("Null on init");
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: getImageFunc,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                constraints: BoxConstraints(maxHeight: 500),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Get.theme.cardColor,
                    image: image == null
                        ? null
                        : DecorationImage(
                            image: FileImage(image!), fit: BoxFit.cover)),
              ),
            ),
            image == null
                ? Container(
              constraints: BoxConstraints(maxHeight: 500),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Get.theme.primaryColor.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_outlined, size: 30),
                        Text("Yükle")
                      ],
                    ),
                  )
                : Positioned(
                    right: 10,
                    top: 5,
                    child: InkWell(
                      onTap:
                          deleteFunc ?? () => log("function null on inkwell"),
                      child: Container(
                        constraints: BoxConstraints(maxHeight: 50),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Themes.darkerBackground),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ),
          ],
        ),
      );
}
