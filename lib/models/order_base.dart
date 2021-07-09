import 'package:enstrurent/models/order_status.dart';

class OrderBase {
  final String id;
  final DateTime CreatedAt;
  final DateTime? UpdatedAt;
  final DateTime? DeletedAt;
  final String? product_id;
  final String? client_id;
  final String? address_id;
  final String? delivery_type;
  final String? payment_method;
  final OrderStatus? order_status;

  static OrderStatus? toOrderStatus(int value) {
    switch(value) {
      case -1:
        return OrderStatus.CANCELED;
      case 0:
        return OrderStatus.NEW_ORDER;
      case 1:
        return OrderStatus.READY;
      case 2:
        return OrderStatus.ON_DELIVERY;
      case 3:
        return OrderStatus.ARRIVED;
      case 4:
        return OrderStatus.COMPLETED;
      default:
        return null;
    }

  }
  OrderBase(
      this.id,
      this.CreatedAt,
      this.UpdatedAt,
      this.DeletedAt,
      this.product_id,
      this.client_id,
      this.address_id,
      this.delivery_type,
      this.payment_method,
      this.order_status);
}


