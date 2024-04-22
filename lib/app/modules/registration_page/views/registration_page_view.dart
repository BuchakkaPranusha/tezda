import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tezda_task/app/constants/colors.dart';
import 'package:tezda_task/app/helpers/authorization_helper.dart';
import 'package:tezda_task/app/helpers/toasst.dart';
import 'package:tezda_task/app/routes/app_pages.dart';

import '../controllers/registration_page_controller.dart';

class RegistrationPageView extends GetView<RegistrationPageController> {
  const RegistrationPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
              child: Column(children: [
            SizedBox(
              height: 150,
            ),
            Center(
                child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w500, color: mainColor),
            )),
            SizedBox(
              height: 36,
            ),
            Container(
                width: Get.width * 0.85,
                decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(12)),
                child: TextFormField(
                  style: TextStyle(color: Colors.grey[900]),
                  controller: controller.emailController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      fieldsValidation();
                    } else {
                      print("object");
                    }
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: mainColor,
                      ),
                      counterText: "",
                      contentPadding: const EdgeInsets.only(left: 20),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Enter Name",
                      labelStyle: TextStyle(
                          color: Color(0xff595959),
                          fontSize: 15,
                          fontFamily: "Poppins-Regular")),
                )),
            const SizedBox(height: 16),
            Container(
                width: Get.width * 0.85,
                decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey[900]),
                    controller: controller.passwordController,
                    onChanged: (value) {
                      // print(value);
                      fieldsValidation();
                    },
                    obscureText: controller.hideTextPass.value,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.hideTextPass.value =
                                !controller.hideTextPass.value;
                          },
                          icon: !controller.hideTextPass.value
                              ? Image.asset(
                                  "assets/images/visible_icon.png",
                                  height: 18,
                                  width: 22,
                                )
                              : Image.asset(
                                  "assets/images/hide_icon.png",
                                  height: 18,
                                  width: 22,
                                ),
                        ),
                        counterText: "",
                        contentPadding: const EdgeInsets.only(left: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Enter Password",
                        labelStyle: const TextStyle(
                            color: Color(0xff595959),
                            fontSize: 15,
                            fontFamily: "Poppins-Regular")),
                  ),
                )),
            const SizedBox(height: 16),
            Container(
                width: Get.width * 0.85,
                decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey[900]),
                    controller: controller.re_enterPasswordController,
                    onChanged: (value) {
                      // print(value);
                      fieldsValidation();
                      if (value.isNotEmpty) {
                        if (controller.passwordController.value.text != value) {
                          controller.passwordsMatching.value = true;
                        } else {
                          controller.passwordsMatching.value = false;
                        }
                      }
                    },
                    obscureText: controller.hideTextNewRePass.value,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.hideTextNewRePass.value =
                                !controller.hideTextNewRePass.value;
                          },
                          icon: !controller.hideTextNewRePass.value
                              ? Image.asset(
                                  "assets/images/visible_icon.png",
                                  height: 18,
                                  width: 22,
                                )
                              : Image.asset(
                                  "assets/images/hide_icon.png",
                                  height: 18,
                                  width: 22,
                                ),
                        ),
                        counterText: "",
                        contentPadding: const EdgeInsets.only(left: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Re-enter Password",
                        labelStyle: const TextStyle(
                            color: Color(0xff595959),
                            fontSize: 15,
                            fontFamily: "Poppins-Regular")),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            if (controller.passwordsMatching.value)
              Padding(
                padding: EdgeInsets.only(left: 36),
                child: Row(
                  children: [
                    Icon(
                      Icons.error,
                      color: mainColor,
                      size: 12,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Passwords doesn’t match",
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 12,
                          fontFamily: "Poppins-Regular"),
                    )
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 38),
                child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: "Already have an acount? ",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.LOGIN_PAGE);
                          },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Poppins-Regular",
                        )),
                    TextSpan(
                      text: "Sign In",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.LOGIN_PAGE);
                        },
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                if (controller.isSignUpEnabled.value) {
                  Map userData = {
                    "id": 16,
                    "username": "Pranusha",
                    "email": "pranusha@gmail.com",
                    "firstName": "Buchakka",
                    "lastName": "Pranusha",
                    "gender": "female",
                    "image": "https://robohash.org/Jeanne.png?set=set4",
                    "token":
                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvSmVhbm5lLnBuZz9zZXQ9c2V0NCIsImlhdCI6MTcxMTIwOTAwMSwiZXhwIjoxNzExMjEyNjAxfQ.F_ZCpi2qdv97grmWiT3h7HcT1prRJasQXjUR4Nk1yo8"
                  };

                  setProfile(userData);
                  Get.offAllNamed(Routes.HOME);
                } else {
                  toast("please enter above details");
                }
              },
              child: Center(
                child: Container(
                  width: Get.width * 0.9,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.isSignUpEnabled.value
                          ? Colors.black
                          : const Color(0xffD9D9D9)),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: !controller.isSignUpEnabled.value
                              ? const Color(0xff595959)
                              : Colors.white,
                          fontFamily: "Poppins-Regular",
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ])));
    }));
  }

  fieldsValidation() {
    if (controller.emailController.text.isNotEmpty &&
        controller.passwordController.text.isNotEmpty &&
        controller.re_enterPasswordController.text.isNotEmpty) {
      controller.isSignUpEnabled.value = true;
    } else {
      controller.isSignUpEnabled.value = false;
    }
  }
}
