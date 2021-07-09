import 'package:enstrurent/models/date_range.dart';
import 'package:enstrurent/models/order_base.dart';
import 'package:enstrurent/models/order_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_order.g.dart';

@JsonSerializable()
class RentOrder extends OrderBase {
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
  final List<String>? initial_image_names;
  final List<String>? final_image_names;
  final double deposit_price;
  final double renting_price;
  final DateRange rented_date_range;

  RentOrder(
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
      this.initial_image_names,
      this.final_image_names,
      this.deposit_price,
      this.renting_price,
      this.rented_date_range)
      : super(id, CreatedAt, UpdatedAt, DeletedAt, product_id, client_id,
            address_id, delivery_type, payment_method, order_status);

  factory RentOrder.fromJson(Map<String, dynamic> json) =>
      _$RentOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RentOrderToJson(this);
}
