import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0), // Adjust top padding if needed
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Daily Grocery\n", // Line break to move "Food" below
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24, // Larger size for "Daily Grocery"
                ),
              ),
              TextSpan(
                text: "Food", // "Food" appears below
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 27, // Slightly smaller size for "Food"
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
      elevation: 0, // Optional: Removes AppBar shadow
    );
  }

  // Increase the height of the AppBar to accommodate two lines of text
  @override
  Size get preferredSize => const Size.fromHeight(80); // Adjust height to fit both lines
}
