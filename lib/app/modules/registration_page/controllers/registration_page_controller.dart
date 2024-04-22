import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPageController extends GetxController {
  //TODO: Implement RegistrationPageController

  final count = 0.obs;
     final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final  re_enterPasswordController = TextEditingController();
  final passwordsMatching = false.obs;
  final hideTextNewRePass = true.obs;
  final hideTextPass = true.obs;
  final isSignUpEnabled = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
