import 'package:json_annotation/json_annotation.dart';

part 'renter.g.dart';

@JsonSerializable()
class Renter {
  final String id;
  final DateTime CreatedAt;
  DateTime UpdatedAt;
  DateTime DeletedAt;
  final String name;
  final String surname;
  final String email;
  final String store_info;
  final String store_name;
  final String phone_number;
  final double rating;
  final String profile_pic_name;
  final String header_pic_name;
  final String address_id;

  Renter(
      this.id,
      this.CreatedAt,
      this.UpdatedAt,
      this.DeletedAt,
      this.name,
      this.surname,
      this.email,
      this.store_info,
      this.store_name,
      this.phone_number,
      this.rating,
      this.profile_pic_name,
      this.header_pic_name,
      this.address_id);

  factory Renter.fromJson(Map<String, dynamic> json) => _$RenterFromJson(json);

  Map<String, dynamic> toJson() => _$RenterToJson(this);
}
