import 'package:flutter/material.dart';
import 'package:app_getx/reuse_order/status_buttons.dart';
import 'package:app_getx/reuse_order/Order_list.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
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
            child: OrderList(
              statusFilter: selectedStatus,
            ),
          ),
        ],
      ),
    );
  }
}

class StatusButtons extends StatelessWidget {
  final String selectedStatus;
  final Function(String) onStatusChange;

  const StatusButtons({
    Key? key,
    required this.selectedStatus,
    required this.onStatusChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            StatusButton(
              text: 'All Order',
              isSelected: selectedStatus == 'All Order',
              onTap: () => onStatusChange('All Order'),
            ),
            StatusButton(
              text: 'Pending',
              isSelected: selectedStatus == 'Pending',
              onTap: () => onStatusChange('Pending'),
            ),
            StatusButton(
              text: 'Processing',
              isSelected: selectedStatus == 'Processing',
              onTap: () => onStatusChange('Processing'),
            ),
            StatusButton(
              text: 'Delivered',
              isSelected: selectedStatus == 'Delivered',
              onTap: () => onStatusChange('Delivered'),
            ),
          ],
        ),
      ),
    );
  }
}
