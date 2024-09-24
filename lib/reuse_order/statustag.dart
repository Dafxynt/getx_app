import 'package:flutter/material.dart';

class StatusTag extends StatelessWidget {
  final String status;

  const StatusTag({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    if (status == 'Delivered') {
      bgColor = Colors.green;
    } else if (status == 'Pending') {
      bgColor = Colors.orange;
    } else {
      bgColor = Colors.blue;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
