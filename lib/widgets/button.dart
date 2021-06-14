import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color buttonColor;

  Button(
      {required this.text,
      required this.onClick,
      required this.buttonColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onClick(),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            elevation: MaterialStateProperty.all(5),
            minimumSize: MaterialStateProperty.all(Size(130, 45))),
        child: Text(text,
            style: Get.textTheme.bodyText1!.copyWith(
                fontFamily: "BebasNeue", fontSize: 18, letterSpacing: 2)));
  }
}
