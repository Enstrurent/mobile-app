
part 'client.g.dart';

class Client {
  final String? id;
  final DateTime? CreatedAt;
  DateTime? UpdatedAt;
  DateTime? DeletedAt;
  final String name;
  final String surname;
  final String email;
  final String phone_number;
  final String? image_name;
  final String? address_id;

  Client(
      {this.id,
      this.CreatedAt,
      this.UpdatedAt,
      this.DeletedAt,
      required this.name,
      required this.surname,
      required this.email,
      required this.phone_number,
      this.image_name,
      this.address_id});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
