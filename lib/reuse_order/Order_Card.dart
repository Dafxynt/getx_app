import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String date;
  final String status;
  final int quantity;  // Ensure this is of type int

  const OrderCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.date,
    required this.status,
    required this.quantity,  // Pass the quantity as int
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(image),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: $price'),
            Text('Quantity: $quantity'),
            Text('Date: $date'),
            Text('Status: $status'),
          ],
        ),
      ),
    );
  }
}
