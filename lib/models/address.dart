import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String id;
  final DateTime? CreatedAt;
  final DateTime? UpdatedAt;
  final DateTime? DeletedAt;
  final String? title;
  final String city;
  final String state;
  final String? zipcode;
  final String? street;
  final String? building_no;
  final String? address_line;
  final String? description;

  Address(
      this.id,
      this.CreatedAt,
      this.UpdatedAt,
      this.DeletedAt,
      this.title,
      this.city,
      this.state,
      this.zipcode,
      this.street,
      this.building_no,
      this.address_line,
      this.description);

  factory Address.fromJson(String jsonString) =>
      _$AddressFromJson(json.decode(jsonString));

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
