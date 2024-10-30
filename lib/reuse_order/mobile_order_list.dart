import 'package:flutter/material.dart';
import 'package:app_getx/Database/DatabaseHelper.dart';
import 'package:app_getx/reuse_order/item_order.dart';

class MobileOrderList extends StatefulWidget {
  final Function(int) onCancel;
  final String statusFilter;

  const MobileOrderList({
    Key? key,
    required this.onCancel,
    required this.statusFilter,
  }) : super(key: key);

  @override
  _MobileOrderListState createState() => _MobileOrderListState();
}

class _MobileOrderListState extends State<MobileOrderList> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  late Future<List<OrderItem>> orders;

  @override
  void initState() {
    super.initState();
    _loadOrders(); // Load orders initially
  }

  void _loadOrders() {
    // Fetch orders and update the state
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

          return ListView.builder(
            itemCount: ordersList.length,
            itemBuilder: (context, index) {
              final order = ordersList[index];
              return ListTile(
                title: Text('${order.name} (x${order.quantity})'),
                subtitle: Text('Price: ${order.price}, Status: ${order.status}'),
                leading: Image.network(order.image),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    bool confirm = await _showConfirmationDialog(context);
                    if (confirm) {
                      await databaseHelper.deleteOrder(order.id!); // Delete order in the database
                      _loadOrders(); // Refresh the list after deletion
                    }
                  },
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
