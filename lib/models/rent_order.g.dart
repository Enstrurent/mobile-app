// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentOrder _$RentOrderFromJson(Map<String, dynamic> json) {
  return RentOrder(
      json['_id'] as String,
      DateTime.parse(json['CreatedAt'] as String),
      json['UpdatedAt'] == null
          ? null
          : DateTime.parse(json['UpdatedAt'] as String),
      json['DeletedAt'] == null
          ? null
          : DateTime.parse(json['DeletedAt'] as String),
      json['product_id'] as String?,
      json['client_id'] as String?,
      json['address_id'] as String?,
      json['delivery_type'] as String?,
      json['payment_method'] as String?,
      OrderBase.toOrderStatus((json['order_status'] as int?) ?? -2),
      (json['initial_image_names'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  (json['final_image_names'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  (json['deposit_price'] as num).toDouble(),
  (json['renting_price'] as num).toDouble(),
  DateRange.fromJson(json['rented_date_range'])
  );
}

Map<String, dynamic> _$RentOrderToJson(RentOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.CreatedAt.toIso8601String(),
      'UpdatedAt': instance.UpdatedAt?.toIso8601String(),
      'DeletedAt': instance.DeletedAt?.toIso8601String(),
      'product_id': instance.product_id,
      'client_id': instance.client_id,
      'address_id': instance.address_id,
      'delivery_type': instance.delivery_type,
      'payment_method': instance.payment_method,
      'order_status': instance.order_status,
      'initial_image_names': instance.initial_image_names,
      'final_image_names': instance.final_image_names,
      'deposit_price': instance.deposit_price,
      'renting_price': instance.renting_price,
      'rented_date_range': {
        'start': instance.rented_date_range.start,
        'end': instance.rented_date_range.end
      }
    };
