import 'package:flutter/material.dart';
import 'package:app_getx/Database/DatabaseHelper.dart';
import 'package:app_getx/reuse_order/item_order.dart';

class OrderListPage extends StatefulWidget {
  final String statusFilter;

  const OrderListPage({Key? key, required this.statusFilter}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  late Future<List<OrderItem>> _orders;

  @override
  void initState() {
    super.initState();
    _refreshOrders();
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

  Future<bool> _showConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<OrderItem>>(
        future: _orders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching orders'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders'));
          } else {
            final orders = snapshot.data!.where((order) {
              return widget.statusFilter == 'All Order' || order.status == widget.statusFilter;
            }).toList();

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text('${order.name} (x${order.quantity})'),
                  subtitle: Text('Price: ${order.price}, Status: ${order.status}'),
                  leading: Image.network(order.image),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      bool confirm = await _showConfirmationDialog(context);
                      if (confirm) {
                        _cancelOrder(order.id!);
                      }
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  // Tambahkan fungsi untuk refresh dari halaman Search
  void refreshFromSearch() {
    _refreshOrders();
  }
}
