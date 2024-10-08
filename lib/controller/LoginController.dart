import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email == 'admin@gmail.com' && password == '123') {
      Get.snackbar('Login Success', 'You have successfully logged in.');
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password.');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
