// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
    json['id'] as String,
    DateTime.parse(json['CreatedAt'] as String),
    DateTime.parse(json['UpdatedAt'] as String),
    DateTime.parse(json['DeletedAt'] as String),
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
    json['phone_number'] as String,
    json['image_name'] as String,
    json['address_id'] as String,
  );
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.CreatedAt.toIso8601String(),
      'UpdatedAt': instance.UpdatedAt.toIso8601String(),
      'DeletedAt': instance.DeletedAt.toIso8601String(),
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'image_name': instance.image_name,
      'address_id': instance.address_id,
    };
