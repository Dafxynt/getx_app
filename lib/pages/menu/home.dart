import 'package:flutter/material.dart';
import 'package:app_getx/reusehome/custom_tab_view.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of categories
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: const CustomTabView(), // Use CustomTabView
        ),
      ),
    );
  }
}
