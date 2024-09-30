import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, // Use backgroundColor instead of primary
          padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          foregroundColor: Colors.white,
        ),
        child: Text(
          'Log Out',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
