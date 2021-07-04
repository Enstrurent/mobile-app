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
    (json['delivery_types'] as List<dynamic>).map((e) => e as String).toList(),
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
    json['rented_days_ranges'] == null
        ? null
        : (json['rented_days_ranges'] as List)
        .map((e) => (e as List).map((e) => e as DateTime).toList())
        .toList(),
    json['thumbnail_names'] != null
        ? (json['thumbnail_names'] as List<dynamic>)
        .map((e) => e as String)
        .toList()
        : null,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.createdAt.toIso8601String(),
      'UpdatedAt': instance.updatedAt.toIso8601String(),
      'DeletedAt': instance.deletedAt.toIso8601String(),
      'renter_id': instance.renterId,
      'city': instance.city,
      'category': instance.category,
      'brand': instance.brand,
      'model': instance.model,
      'info': instance.info,
      'is_rental': instance.isRental,
      'is_deposit_required': instance.isDepositRequired,
      'is_open_to_sell': instance.isOpenToSell,
      'is_used': instance.isUsed,
      'max_rental_days': instance.maxRentalDays,
      'daily_price': instance.dailyPrice,
      'full_price': instance.fullPrice,
      'deposit_price': instance.depositPrice,
      'stock_quantity': instance.stockQuantity,
      'delivery_types': instance.deliveryTypes,
      'image_names': instance.imageNames,
      'thumbnail_names': instance.thumbnailNames,
      'tags': instance.tags,
      'payment_methods': instance.paymentMethods,
      'is_published': instance.isPublished,
      'rented_days_ranges': instance.rentedDaysRanges
    };
