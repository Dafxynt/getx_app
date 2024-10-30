import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_getx/pages/Homepage.dart';
import 'package:app_getx/pages/LoginPage.dart';
import 'package:app_getx/Binding/LoginBinding.dart';
import 'package:app_getx/controller/ordercontroller.dart';
import 'package:app_getx/controller/bottomNav_Controller.dart';
import 'package:app_getx/controller/responsive_controller.dart';
import 'package:app_getx/pages/menu/responsive_order_layout.dart';

void main() {
  // Initialize the controllers
  Get.put(OrderController());
  Get.put(ResponsiveController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Responsive App with GetX',
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
        // Add a route for the responsive layout
        GetPage(
          name: '/responsive',
          page: () => ResponsiveLayout(),
        ),
      ],
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraint) {
            // Update screen width for the responsive controller
            final responsiveController = Get.find<ResponsiveController>();
            responsiveController.updateScreenWidth(constraint.maxWidth);
            return  ResponsiveLayout(); // Show the responsive layout
          },
        ),
      ),
    );
  }
}
