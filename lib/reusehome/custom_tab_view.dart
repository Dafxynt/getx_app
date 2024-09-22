import 'package:flutter/material.dart';
import 'package:app_getx/reusehome/drink.dart';
import 'package:app_getx/reusehome/vegetables_data.dart';
import 'package:app_getx/reusehome/fastfood_data.dart';
import 'package:app_getx/pages/menu/product_grid.dart';
import 'fruits_data.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          // Container to align TabBar to the left
          Container(
            alignment: Alignment.centerLeft, // Align to the left
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30), // Oval shape
              ),
              tabs: [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Fruits'),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Fast-food'),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Vegetables'),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Drinks'),
                  ),
                ),
              ],
            ),
          ),
          // Section title for popular items
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          // ProductGrid for TabBarView
          Expanded(
            child: TabBarView(
              children: [
                ProductGrid(products: fruits),      // Fruits tab
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
