import 'package:flutter/material.dart';
import 'package:app_getx/reuse_order/status_buttons.dart';
import 'package:app_getx/reuse_order/Order_list.dart';
import 'package:app_getx/Database/DatabaseHelper.dart';

class Pesan extends StatefulWidget {
  const Pesan({super.key});

  @override
  State<Pesan> createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  String selectedStatus = 'All Order';

  void updateStatus(String status) {
    setState(() {
      selectedStatus = status;
    });
  }

  Future<void> _refreshOrders() async {
    setState(() {
      // You can update the list of orders or any necessary state here
    });
  }

  void _startSearch(BuildContext context) async {
    final orders = await DatabaseHelper().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          StatusButtons(
            selectedStatus: selectedStatus,
            onStatusChange: updateStatus,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: OrderListPage(
              statusFilter: selectedStatus,
            ),
          ),
        ],
      ),
    );
  }
}
