import 'package:flutter/material.dart';
import 'package:app_getx/Database/DatabaseHelper.dart';
import 'package:app_getx/reuse_order/item_order.dart';

class TabletOrderList extends StatefulWidget {
  final Function(int) onCancel;
  final String statusFilter;

  const TabletOrderList({
    Key? key,
    required this.onCancel,
    required this.statusFilter,
  }) : super(key: key);

  @override
  _TabletOrderListState createState() => _TabletOrderListState();
}

class _TabletOrderListState extends State<TabletOrderList> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  late Future<List<OrderItem>> orders;

  @override
  void initState() {
    super.initState();
    _loadOrders(); // Initial load
  }

  void _loadOrders() {
    setState(() {
      orders = databaseHelper.getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderItem>>(
      future: orders,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching orders'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No orders'));
        } else {
          final ordersList = snapshot.data!.where((order) {
            return widget.statusFilter == 'All Order' || order.status == widget.statusFilter;
          }).toList();

          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Increases the number of columns
              childAspectRatio: 0.9, // Makes the cards smaller vertically
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: ordersList.length,
            itemBuilder: (context, index) {
              final order = ordersList[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(order.image, fit: BoxFit.cover),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '${order.name} (x${order.quantity})',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Price: ${order.price}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Status: ${order.status}',
                        style: TextStyle(fontSize: 12),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, size: 20, color: Colors.red),
                        onPressed: () async {
                          bool confirm = await _showConfirmationDialog(context);
                          if (confirm) {
                            await databaseHelper.deleteOrder(order.id!);
                            _loadOrders();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this order?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }
}
