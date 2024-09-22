import 'package:get/get.dart';

class BottomNavCtr extends GetxController {
  var selectedIndex = 0.obs;
  void changeIndexMenu(int index) {
    selectedIndex.value = index;
  }
}