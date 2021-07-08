class OrderBase {
  final String id;
  final DateTime CreatedAt;
  final DateTime? UpdatedAt;
  final DateTime? DeletedAt;
  final String? product_id;
  final String? client_id;
  final String? address_id;
  final String? delivery_type;
  final String? payment_method;
  final String? order_status;

  OrderBase(
      this.id,
      this.CreatedAt,
      this.UpdatedAt,
      this.DeletedAt,
      this.product_id,
      this.client_id,
      this.address_id,
      this.delivery_type,
      this.payment_method,
      this.order_status);
}
