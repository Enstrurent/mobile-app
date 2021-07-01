// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
      json['id'] as String,
      DateTime.parse(json['CreatedAt'] as String),
      DateTime.parse(json['UpdatedAt'] as String),
      DateTime.parse(json['DeletedAt'] as String),
      json['renter_id'] as String,
      json['city'] as String,
      json['category'] as String,
      json['brand'] as String,
      json['model'] as String,
      json['info'] as String,
      json['is_rental'] as bool,
      json['is_deposit_required'] as bool,
      json['is_open_to_sell'] as bool,
      json['is_used'] as bool,
      json['max_rental_days'] as int,
      (json['daily_price'] as num).toDouble(),
      (json['full_price'] as num).toDouble(),
      json['deposit_price'] as int,
      json['stock_quantity'] as int,
      (json['delivery_types'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      json['image_names'] != null
          ? (json['image_names'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          : [],
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['payment_methods'] != null
          ? (json['payment_methods'] as List).map((e) => e as String).toList()
          : [],
      json['is_published'],
      json['rented_days_range'] == null
          ? null
          : (json['rented_days_range'] as List)
              .map((e) => (e as List).map((e) => e as DateTime).toList())
              .toList());
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.CreatedAt.toIso8601String(),
      'UpdatedAt': instance.UpdatedAt.toIso8601String(),
      'DeletedAt': instance.DeletedAt.toIso8601String(),
      'renter_id': instance.renter_id,
      'city': instance.city,
      'category': instance.category,
      'brand': instance.brand,
      'model': instance.model,
      'info': instance.info,
      'is_rental': instance.is_rental,
      'is_deposit_required': instance.is_deposit_required,
      'is_open_to_sell': instance.is_open_to_sell,
      'is_used': instance.is_used,
      'max_rental_days': instance.max_rental_days,
      'daily_price': instance.daily_price,
      'full_price': instance.full_price,
      'deposit_price': instance.deposit_price,
      'stock_quantity': instance.stock_quantity,
      'delivery_types': instance.delivery_types,
      'image_names': instance.image_names,
      'tags': instance.tags,
      'payment_methods': instance.payment_methods,
      'is_published': instance.is_published,
      'rented_days_range': instance.rented_days_range
    };
