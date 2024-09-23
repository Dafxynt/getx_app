import 'package:flutter/material.dart';
import 'package:app_getx/reusehome/popular.dart';
import 'package:app_getx/reusehome/drink.dart';
import 'package:app_getx/reusehome/vegetables_data.dart';
import 'package:app_getx/reusehome/fastfood_data.dart';
import 'package:app_getx/pages/menu/product_grid.dart';
import 'fruits_data.dart';
import 'package:app_getx/reusehome/custom_tab_bar.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key});

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> titles = [
    'Popular Fruits',
    'Fruits',
    'Fast-food',
    'Vegetables',
    'Drinks'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: titles.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(
          tabs: ['Popular', 'Fruits', 'Fast-food', 'Vegetables', 'Drinks'],
          selectedColor: Colors.white,
          unselectedColor: Colors.black,
          indicatorColor: Colors.black,
          controller: _tabController, // Pass the controller here
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedBuilder(
                animation: _tabController,
                builder: (context, child) {
                  return Text(
                    titles[_tabController.index],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ProductGrid(products: popular),
              ProductGrid(products: fruits),
              ProductGrid(products: fastfoods),
              ProductGrid(products: vegetables),
              ProductGrid(products: Drinks),
            ],
          ),
        ),
      ],
    );
  }
}
