import 'package:app_getx/Controller/BottomNav_Controller.dart';
import 'package:app_getx/pages/menu/home.dart';
import 'package:app_getx/pages/menu/pesan.dart';
import 'package:app_getx/pages/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {

    //connect ui to ctr
    final BottomNavCtr bottomNavCtr =
    Get.put(BottomNavCtr());

    final List<Widget> menus = [Home(), Pesan(), Profile()];

    return Obx(() {
      return Scaffold(
        body: menus[bottomNavCtr.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavCtr.selectedIndex.value,
          onTap: bottomNavCtr.changeIndexMenu,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Setting"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Profile"),
          ],
        ),
      );
    });
  }
}

