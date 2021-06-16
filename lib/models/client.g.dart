// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
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
    phone_number: json['phone_number'] as String,
    image_name: json['image_name'] as String?,
    address_id: json['address_id'] as String?,
  );
}

Map<String, dynamic> _$ClientToJson(Client instance) {
  if (instance.id != null)
    return <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.CreatedAt?.toIso8601String(),
      'UpdatedAt': instance.UpdatedAt?.toIso8601String(),
      'DeletedAt': instance.DeletedAt?.toIso8601String(),
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'image_name': instance.image_name,
      'address_id': instance.address_id,
    };
  else return <String, dynamic>{
    'name': instance.name,
    'surname': instance.surname,
    'email': instance.email,
    'phone_number': instance.phone_number,
  };
}
