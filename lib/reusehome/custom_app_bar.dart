import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Daily Grocery Food",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0, // Set elevation to 0 to remove the bottom line
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
