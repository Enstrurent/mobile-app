import 'package:enstrurent/models/order_status.dart';
import 'package:json_annotation/json_annotation.dart';

import 'order_base.dart';

part 'purchase_order.g.dart';

@JsonSerializable()
class PurchaseOrder extends OrderBase {
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
  final double price;

  PurchaseOrder(
      this.id,
      this.CreatedAt,
      this.UpdatedAt,
      this.DeletedAt,
      this.product_id,
      this.client_id,
      this.address_id,
      this.delivery_type,
      this.payment_method,
      this.order_status,
      this.price)
      : super(
            id,
            CreatedAt,
            UpdatedAt,
            DeletedAt,
            product_id,
            client_id,
            address_id,
            delivery_type,
            payment_method,
            order_status);

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseOrderToJson(this);
}
