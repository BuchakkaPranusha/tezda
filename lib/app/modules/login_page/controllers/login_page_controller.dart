import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/app/helpers/authorization_helper.dart';
import 'package:tezda_task/app/modules/product_details_page/controllers/product_details_page_controller.dart';
import 'package:tezda_task/app/modules/products_page/controllers/products_page_controller.dart';
import 'package:tezda_task/app/providers/AllProviders.dart';
import 'package:tezda_task/app/providers/response_handler.dart';
import 'package:tezda_task/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  final count = 0.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hideTextNewRePass = true.obs;
  final isSignInenabled = false.obs;
  final userLogin = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  logIn(Map data) async {
    print("Printing data: $data");
    try {
      userLogin.value = true;
      var res = await AllProviders().login(data);
      isResponseNull(res);
      if(res.statusCode == 200){
        var response = res.body;
        print("log in response::::::::::::$response");
        print("user token::::::::::::${response['token']}");
        setProfile(response);
        setToken(response['token']);
        setOnBoarding(true);
        Get.offAllNamed(Routes.HOME);
      }
      userLogin.value = false;
    } catch (e) {
      userLogin.value = false;
      print('login Controller Error : ${e}');
    }
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
