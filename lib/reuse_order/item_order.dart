class OrderItem {
  final int? id; // Make id nullable since it will be assigned by the database
  final String name;
  final String image;
  final String price;
  final int quantity;
  final String status;

  OrderItem({
    this.id, // Optional, since it may be null for new items
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.status,
  });

  // Convert OrderItem to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'status': status,
    };
  }

  // Create OrderItem from Map
  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'] as int?, // Use `as` to ensure type is correct
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as String,
      quantity: map['quantity'] as int,
      status: map['status'] as String,
    );
  }
}
