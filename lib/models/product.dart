import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';
@JsonSerializable()
class Product {
  final String id;
  final DateTime CreatedAt;
  final DateTime UpdatedAt;
  final DateTime DeletedAt;
  final String renter_id;
  final String city;
  final String category;
  final String brand;
  final String model;
  final String info;
  final bool is_rental;
  final bool is_deposit_required;
  final bool is_open_to_sell;
  final bool is_used;
  final int max_rental_days;
  final double daily_price;
  final double full_price;
  final int deposit_price;
  final int stock_quantity;
  final List<String> delivery_types;
  final List<String> image_names;
  final List<String>? thumbnail_names;
  final List<String> tags;
  final List<String>? payment_methods;
  final bool? is_published;
  final List<List<DateTime>?>? rented_days_range;

  Product(this.id, this.CreatedAt, this.UpdatedAt, this.DeletedAt,
      this.renter_id, this.city, this.category, this.brand, this.model,
      this.info, this.is_rental, this.is_deposit_required, this.is_open_to_sell,
      this.is_used, this.max_rental_days, this.daily_price, this.full_price,
      this.deposit_price, this.stock_quantity, this.delivery_types,
      this.image_names, this.tags, this.payment_methods, this.is_published, this.rented_days_range, this.thumbnail_names);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

 String generateTitle() => "${this.brand} ${this.model}";
}