import 'package:flutter/material.dart';
import 'package:app_getx/pages/Homepage.dart';
import 'package:app_getx/pages/LoginPage.dart';
import 'package:app_getx/Binding/LoginBinding.dart';
import 'package:app_getx/controller/ordercontroller.dart';
import 'package:app_getx/controller/bottomNav_Controller.dart';
import 'package:get/get.dart';

void main() {
  Get.put(OrderController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => const Homepage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => BottomNavCtr());
          }),
        ),
      ],
    );
  }
}
