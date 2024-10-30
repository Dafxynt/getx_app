import 'package:app_getx/controller/bottomNav_Controller.dart';
import 'package:app_getx/pages/menu/home.dart';
import 'package:app_getx/pages/menu/pesan.dart';
import 'package:app_getx/pages/menu/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hubungkan UI dengan controller
    final BottomNavCtr bottomNavCtr = Get.put(BottomNavCtr());

    // List halaman menu
    final List<Widget> menus = [Home(), Pesan(), Profile()];

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // Menghilangkan bayangan AppBar
          title: Row(
            children: [
              const Text(
                'Daily Food App',
                style: TextStyle(
                  color: Colors.black, // Warna teks judul
                  fontSize: 20.0, // Ukuran font judul
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20), // Jarak antara judul dan search bar
              Expanded(
                child: Container(
                  height: 40, // Tinggi search field
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: menus[bottomNavCtr.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavCtr.selectedIndex.value,
          onTap: bottomNavCtr.changeIndexMenu,
          items: const [
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
