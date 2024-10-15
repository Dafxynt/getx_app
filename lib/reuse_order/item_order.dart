class OrderItem {
  int? id; // Make id nullable since it will be assigned by the database
  final String name;
  final String image;
  final String price;
  final int quantity;
  final String status;

  OrderItem({
    this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.status,
  });

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

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      quantity: map['quantity'],
      status: map['status'],
    );
  }
}
