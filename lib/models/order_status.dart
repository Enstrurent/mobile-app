import 'package:get/get.dart';

enum OrderStatus {
  CANCELED,
  NEW_ORDER,
  READY,
  ON_DELIVERY,
  ARRIVED,
  COMPLETED,
}

extension OrderStatusExtension on OrderStatus {
  int get numValue {
    switch(this) {
      case OrderStatus.CANCELED:
        return -1;
      case OrderStatus.NEW_ORDER:
        return 0;
      case OrderStatus.READY:
        return 1;
      case OrderStatus.ON_DELIVERY:
        return 2;
      case OrderStatus.ARRIVED:
        return 3;
      case OrderStatus.COMPLETED:
        return 4;
      default:
        return -2;
    }
  }

  String get getStatusText {
    switch(this) {
      case OrderStatus.CANCELED:
        return "canceled".tr;
      case OrderStatus.NEW_ORDER:
        return "new_order".tr;
      case OrderStatus.READY:
        return "ready".tr;
      case OrderStatus.ON_DELIVERY:
        return "on_delivery".tr;
      case OrderStatus.ARRIVED:
        return "arrived".tr;
      case OrderStatus.COMPLETED:
        return "completed".tr;
      default:
        return "";
    }
  }
}