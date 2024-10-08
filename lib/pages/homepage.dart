import 'package:app_getx/controller/bottomNav_Controller.dart';
import 'package:app_getx/pages/menu/home.dart';
import 'package:app_getx/pages/menu/pesan.dart';
import 'package:app_getx/reuse_order/Order_list.dart';
import 'package:app_getx/pages/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Connect UI to controller
    final BottomNavCtr bottomNavCtr = Get.put(BottomNavCtr());

    // List of menu pages
    final List<Widget> menus = [Home(), Pesan(), Profile()];

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('Daily Food App'), // Set your app bar title here
          actions: [
            ElevatedButton(
              onPressed: () {
                // Here you should provide the status filter, for example, 'All Order'
                Get.to(OrderListPage(statusFilter: 'All Order'));
              },
              child: Text('View Orders'),
            ),
          ],
        ),
        body: menus[bottomNavCtr.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavCtr.selectedIndex.value,
          onTap: bottomNavCtr.changeIndexMenu,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
