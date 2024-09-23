import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0), // Adjust top and bottom padding
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Daily\n", // Line break to move "Grocery Food" below
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24, // Adjusted size for "Daily"
                ),
              ),
              TextSpan(
                text: "Grocery Food", // "Grocery Food" appears below
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24, // Adjusted size for "Grocery Food"
                ),
              ),
            ],
          ),
          textAlign: TextAlign.left, // Align text to the left
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
