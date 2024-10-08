// Order_list.dart
import 'package:flutter/material.dart';
import 'package:app_getx/Database/DatabaseHelper.dart';
import 'package:app_getx/reuse_order/item_order.dart';

class OrderListPage extends StatefulWidget {
  final String statusFilter; // Add this line

  // Update the constructor to accept the status filter
  const OrderListPage({Key? key, required this.statusFilter}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  late Future<List<OrderItem>> _orders;

  @override
  void initState() {
    super.initState();
    _orders = DatabaseHelper().getOrders();
  }

  Future<void> _refreshOrders() async {
    setState(() {
      _orders = DatabaseHelper().getOrders();
    });
  }

  Future<void> _cancelOrder(int id) async {
    await DatabaseHelper().deleteOrder(id);
    _refreshOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Orders')),
      body: FutureBuilder<List<OrderItem>>(
        future: _orders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching orders'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders yet'));
          } else {
            final orders = snapshot.data!.where((order) {
              // Filter orders based on status
              return widget.statusFilter == 'All Order' || order.status == widget.statusFilter;
            }).toList();

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text('${order.name} (x${order.quantity})'),
                  subtitle: Text('Price: ${order.price}, Status: ${order.status}'),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () => _cancelOrder(order.id!),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
