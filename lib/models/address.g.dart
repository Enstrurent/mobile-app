// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['id'] as String,
    json['CreatedAt'] == null
        ? null
        : DateTime.parse(json['CreatedAt'] as String),
    json['UpdatedAt'] == null
        ? null
        : DateTime.parse(json['UpdatedAt'] as String),
    json['DeletedAt'] == null
        ? null
        : DateTime.parse(json['DeletedAt'] as String),
    json['title'] as String?,
    json['city'] as String,
    json['state'] as String,
    json['zipcode'] as String?,
    json['street'] as String?,
    json['building_no'] as String?,
    json['address_line'] as String?,
    json['description'] as String?,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.CreatedAt?.toIso8601String(),
      'UpdatedAt': instance.UpdatedAt?.toIso8601String(),
      'DeletedAt': instance.DeletedAt?.toIso8601String(),
      'title': instance.title,
      'city': instance.city,
      'state': instance.state,
      'zipcode': instance.zipcode,
      'street': instance.street,
      'building_no': instance.building_no,
      'address_line': instance.address_line,
      'description': instance.description,
    };
