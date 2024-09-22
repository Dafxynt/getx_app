import 'package:flutter/material.dart';
import 'package:app_getx/reusehome/custom_app_bar.dart';  // Import your CustomAppBar
import 'package:app_getx/reusehome/custom_tab_view.dart'; // Import your CustomTabView

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of categories
      child: Scaffold(
        appBar: const CustomAppBar(), // Use CustomAppBar
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: const CustomTabView(), // Use CustomTabView
        ),
      ),
    );
  }
}
