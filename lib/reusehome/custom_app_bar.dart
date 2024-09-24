import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Daily\n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              TextSpan(
                text: "Food App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
      ],
      elevation: 0, // Removes AppBar shadow
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75); // Increased height to fit both lines without clipping
}
