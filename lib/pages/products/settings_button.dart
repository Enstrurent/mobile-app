part of 'products_view.dart';

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      direction: Axis.vertical,
      runAlignment: WrapAlignment.center,
      children: [
        widgets.Button(
          buttonColor: Colors.black26,
          text: "change_lang".tr,
          onClick: () {
            Get.updateLocale(Get.locale.toString() == "en_US"
                ? Locale("tr", "TR")
                : Locale("en", "US"));
            Get.back();
          },
        ),
        Text("data"),
        Text("data"),
      ],
    );
  }
}
