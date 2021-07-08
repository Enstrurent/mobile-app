import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsButton extends StatelessWidget {
  final SettingsController _controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        direction: Axis.vertical,
        runAlignment: WrapAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 6),
            child: Text("change_lang".tr, style: Get.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("TR", style: Get.textTheme.headline4!.copyWith(fontSize: 26),),
              Obx(
                () => Switch(
                  activeColor: Get.theme.primaryColor,
                  value: _controller.isEnglish.value,
                  inactiveThumbColor: Colors.white,
                  onChanged: (value) {
                    _controller.isEnglish.value = value;
                    _controller.updateLocale();
                  },
                ),
              ),
              Text("EN", style: Get.textTheme.headline4!.copyWith(fontSize: 26),),

            ],
          ),
        ],
      ),
    );
  }
}

class SettingsController extends GetxController {
  var isEnglish = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.locale.toString() == "en_US") {
      isEnglish.value = true;
    } else {
      isEnglish.value = false;
    }
    update();
  }

  updateLocale() => Get.updateLocale(
      isEnglish.value ? Locale("en", "US") : Locale("tr", "TR"));
}
