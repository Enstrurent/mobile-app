// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Renter _$RenterFromJson(Map<String, dynamic> json) {
  return Renter(
    id: json['id'] as String?,
    CreatedAt: json['CreatedAt'] == null
        ? null
        : DateTime.parse(json['CreatedAt'] as String),
    UpdatedAt: json['UpdatedAt'] == null
        ? null
        : DateTime.parse(json['UpdatedAt'] as String),
    DeletedAt: json['DeletedAt'] == null
        ? null
        : DateTime.parse(json['DeletedAt'] as String),
    name: json['name'] as String,
    surname: json['surname'] as String,
    email: json['email'] as String,
    store_info: json['store_info'] as String,
    store_name: json['store_name'] as String,
    phone_number: json['phone_number'] as String,
    rating: (json['rating'] as num?)?.toDouble(),
    profile_pic_name: json['profile_pic_name'] as String?,
    header_pic_name: json['header_pic_name'] as String?,
    address_id: json['address_id'] as String?,
  );
}

Map<String, dynamic> _$RenterToJson(Renter instance) => <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.CreatedAt?.toIso8601String(),
      'UpdatedAt': instance.UpdatedAt?.toIso8601String(),
      'DeletedAt': instance.DeletedAt?.toIso8601String(),
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
