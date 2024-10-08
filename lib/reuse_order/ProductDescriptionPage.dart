import 'package:app_getx/Database/DatabaseHelper.dart';
import 'package:app_getx/reuse_order/item_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDescriptionPage extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String description;
  final String price;

  const ProductDescriptionPage({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  _ProductDescriptionPageState createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  int quantity = 1;

  Future<void> _addOrderToDB() async {
    final order = OrderItem(
      name: widget.productName,
      image: widget.imageUrl,
      price: widget.price,
      quantity: quantity,
      status: 'Pending',
    );
    await DatabaseHelper().addOrder(order);

    Get.snackbar(
      'Order Successful',
      '${widget.productName} (x$quantity) has been added to your order list',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.imageUrl),
            const SizedBox(height: 16),
            Text(
              widget.productName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.description),
            const SizedBox(height: 16),
            Text(
              'Price: ${widget.price}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 16),

            // Quantity Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Quantity:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _addOrderToDB,
                child: const Text('Order Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
