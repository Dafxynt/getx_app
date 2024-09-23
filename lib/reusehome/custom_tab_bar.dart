import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final Color selectedColor;
  final Color unselectedColor;
  final Color indicatorColor;

  const CustomTabBar({
    required this.tabs,
    this.selectedColor = Colors.white,
    this.unselectedColor = Colors.black,
    this.indicatorColor = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.zero,  // Ensure no extra padding
      child: TabBar(
        isScrollable: true,
        labelColor: selectedColor,
        unselectedLabelColor: unselectedColor,
        indicator: BoxDecoration(
          color: indicatorColor,
          borderRadius: BorderRadius.circular(30),
        ),
        tabs: tabs
            .map(
              (tabText) => Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),  // Padding for each tab
              child: Text(tabText),
            ),
          ),
        ).toList(),
        tabAlignment: TabAlignment.start,  // Align tabs to the start
      ),
    );
  }
}
