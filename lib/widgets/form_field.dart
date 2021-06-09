import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FormField extends StatelessWidget {
  final bool readOnly, hideText;
  final TextEditingController controller;
  final ValueSetter<String> validatorFunc;
  final String fieldLabel, hint;
  final TextInputType textInputType;
  final IconData iconData;

  FormField(
      {this.readOnly = false,
        this.controller,
        this.validatorFunc,
        this.fieldLabel,
        this.hint,
        this.iconData,
        this.hideText = false,
        this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        validator: validatorFunc,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: fieldLabel,
          labelStyle: Get.textTheme.bodyText1.copyWith(color: Get.theme.primaryColor),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          suffixIcon: Icon(iconData, color: Colors.grey.shade400),
          errorStyle: Get.textTheme.subtitle1,
        ),
        cursorColor: Get.theme.primaryColor,
        style: Get.textTheme.headline6,
        obscureText: hideText,
      ),
    );
  }
}
