import 'package:app_getx/reusehome/popular.dart';
import 'package:flutter/material.dart';
import 'package:app_getx/reusehome/drink.dart';
import 'package:app_getx/reusehome/vegetables_data.dart';
import 'package:app_getx/reusehome/fastfood_data.dart';
import 'package:app_getx/pages/menu/product_grid.dart';
import 'fruits_data.dart';
import 'package:app_getx/reusehome/custom_tab_bar.dart'; // Import custom TabBar

class CustomTabView extends StatelessWidget {
  const CustomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Updated to 5 tabs
      child: Column(
        children: [
          // Menggunakan CustomTabBar reusable component
          CustomTabBar(
            tabs: ['Popular', 'Fruits', 'Fast-food', 'Vegetables', 'Drinks'],
            selectedColor: Colors.white,
            unselectedColor: Colors.black,
            indicatorColor: Colors.black,
          ),
          // Section title for popular items
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Fruits',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
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
          // ProductGrid for TabBarView
          Expanded(
            child: TabBarView(
              children: [
                ProductGrid(products: popular),      // Popular tab (Add products as needed)
                ProductGrid(products: fruits),   // Fruits tab
                ProductGrid(products: fastfoods),   // Fast-food tab
                ProductGrid(products: vegetables),   // Vegetables tab
                ProductGrid(products: Drinks),       // Drinks tab
              ],
            ),
          ),
        ],
      ),
    );
  }
}
