import 'package:enstrurent/widgets/get_snack.dart';
import 'package:get/get.dart';

class ConfirmController extends GetxController {
  List<String> tags = [
    "gitar",
    "elektro gitar",
    "bass gitar",
    "yeni",
    "ikinci el",
    "piyano",
    "org",
    "synth",
    "davul",
    "bateri",
    "bağlama",
    "ukulele"
  ]; // TODO: Get from backend
  var selectedTags = [].obs;

  List<String> deliveryTypes = ["delivery_by_cargo".tr, "take_from_store".tr];
  var selectedDeliveryTypes = [].obs;

  List<String> paymentMethods = ["Kapıda Ödeme", "Havale"];
  var selectedPaymentMethods = [].obs;

  var isDraft = false.obs;

  Map<String, dynamic>? confirmAndGiveData() {
    if (selectedDeliveryTypes.isEmpty) {
      getSnackBar("error".tr, "Teslimat türü seçmediniz");
      return null;
    } else if (selectedPaymentMethods.isEmpty) {
      getSnackBar("error".tr, "Ödeme yöntemi seçmediniz");
      return null;
    } else return{
      "delivery_types": selectedDeliveryTypes,
      "payment_methods": selectedPaymentMethods,
      "tags": selectedTags.isEmpty ? null : selectedTags,
      "is_published": !isDraft.value
    };
  }

}
