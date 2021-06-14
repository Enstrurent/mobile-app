// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Renter _$RenterFromJson(Map<String, dynamic> json) {
  return Renter(
    json['id'] as String,
    DateTime.parse(json['CreatedAt'] as String),
    DateTime.parse(json['UpdatedAt'] as String),
    DateTime.parse(json['DeletedAt'] as String),
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
    json['store_info'] as String,
    json['store_name'] as String,
    json['phone_number'] as String,
    (json['rating'] as num).toDouble(),
    json['profile_pic_name'] as String,
    json['header_pic_name'] as String,
    json['address_id'] as String,
  );
}

Map<String, dynamic> _$RenterToJson(Renter instance) => <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.CreatedAt.toIso8601String(),
      'UpdatedAt': instance.UpdatedAt.toIso8601String(),
      'DeletedAt': instance.DeletedAt.toIso8601String(),
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'store_info': instance.store_info,
      'store_name': instance.store_name,
      'phone_number': instance.phone_number,
      'rating': instance.rating,
      'profile_pic_name': instance.profile_pic_name,
      'header_pic_name': instance.header_pic_name,
      'address_id': instance.address_id,
    };
