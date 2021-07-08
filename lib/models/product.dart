
part 'product.g.dart';
class Product {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;
  final String renterId;
  final String city;
  final String category;
  final String brand;
  final String model;
  final String info;
  final bool isRental;
  final bool isDepositRequired;
  final bool isOpenToSell;
  final bool isUsed;
  final int maxRentalDays;
  final double dailyPrice;
  final double fullPrice;
  final int depositPrice;
  final int stockQuantity;
  final List<String> deliveryTypes;
  final List<String> imageNames;
  final List<String>? thumbnailNames;
  final List<String> tags;
  final List<String>? paymentMethods;
  final bool? isPublished;
  final List<List<DateTime>?>? rentedDaysRanges;

  Product(this.id, this.createdAt, this.updatedAt, this.deletedAt,
      this.renterId, this.city, this.category, this.brand, this.model,
      this.info, this.isRental, this.isDepositRequired, this.isOpenToSell,
      this.isUsed, this.maxRentalDays, this.dailyPrice, this.fullPrice,
      this.depositPrice, this.stockQuantity, this.deliveryTypes,
      this.imageNames, this.tags, this.paymentMethods, this.isPublished, this.rentedDaysRanges, this.thumbnailNames);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

 String generateTitle() => "${this.brand} ${this.model}";
}