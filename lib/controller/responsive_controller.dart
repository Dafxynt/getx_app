import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  var screenWidth = 0.0.obs;

  void updateScreenWidth(double width) {
    screenWidth.value = width;
  }

  bool isMobile() => screenWidth.value < 600; // Mobile screen width
  bool isTablet() => screenWidth.value >= 600 && screenWidth.value < 1200; // Tablet screen width
}
