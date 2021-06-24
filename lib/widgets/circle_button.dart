import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleButton extends StatelessWidget {
  final double size;
  final VoidCallback? onPressed;
  final IconData iconData;

  const CircleButton(
      {Key? key, this.size = 20, this.onPressed, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
          splashColor: Get.theme.primaryColor,
          onPressed: onPressed,
          shape: CircleBorder(),
          fillColor: Get.theme.primaryColor,
          clipBehavior: Clip.antiAlias,
          child: Icon(
            iconData,
            color: Colors.black,
            size: size,
          )),
    );
    ;
  }
}
