// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseOrder _$PurchaseOrderFromJson(Map<String, dynamic> json) {
  return PurchaseOrder(
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
    (json['price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PurchaseOrderToJson(PurchaseOrder instance) =>
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
      'price': instance.price
    };
