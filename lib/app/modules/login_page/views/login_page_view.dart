import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tezda_task/app/constants/colors.dart';
import 'package:tezda_task/app/helpers/toasst.dart';
import 'package:tezda_task/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:tezda_task/app/routes/app_pages.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: mainColor,
        body: Obx(() {
      return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
              child: Column(children: [
           const SizedBox(
              height: 150,
            ),
            const Center(
                child: Text(
              "Log In",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w500, color: mainColor),
            )),
            const SizedBox(
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
                  decoration:const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:  Icon(
                        Icons.person,
                        color: mainColor,
                      ),
                      counterText: "",
                      contentPadding:  EdgeInsets.only(left: 20),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Enter Name",
                      labelStyle: TextStyle(
                          color: Color(0xff595959),
                          fontSize: 15,
                          fontFamily: "Poppins-Regular")),
                )),
            const SizedBox(height: 10),
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
                        labelText: "Enter Password",
                        labelStyle: const TextStyle(
                            color: Color(0xff595959),
                            fontSize: 15,
                            fontFamily: "Poppins-Regular")),
                  ),
                )),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 38.0),
                child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: "Don't have an acount? ",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.REGISTRATION_PAGE);
                          },
                        style:const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Poppins-Regular",
                        )),
                    TextSpan(
                      text: "Sign Up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.REGISTRATION_PAGE);
                        },
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            const SizedBox(height: 54),
            GestureDetector(
              onTap: () {
                if (controller.isSignInenabled.value) {
                  Map data = {
                    'username': controller.emailController.text,
                    'password': controller.passwordController.text,
                  };
                  print("login data:::::::::$data");
                  controller.logIn(data);
                } else {
                  toast("please enter above details");
                }
              },
              child: Center(
                child: Container(
                  width: Get.width * 0.8,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.isSignInenabled.value
                          ? Colors.black
                          : const Color(0xffD9D9D9)),
                  child: Center(
                    child:
                    // controller.userLogin.value ? const CircularProgressIndicator(color: Colors.white,):
                    Text(
                      "Log In",
                      style: TextStyle(
                          color: !controller.isSignInenabled.value
                              ? const Color(0xff595959)
                              : Colors.white,
                          fontFamily: "Poppins-Regular",
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ]));
    }));
  }

  fieldsValidation() {
    if (controller.emailController.text.isNotEmpty &&
        controller.passwordController.text.isNotEmpty) {
      controller.isSignInenabled.value = true;
    } else {
      controller.isSignInenabled.value = false;
    }
  }

//   loginCondition(context) {
//     print(mobileNumber.text);
//     if (controller.arguments['type'] != "email/mobile") {
//       print("frommmmm");
//       if (!mobileNumber.text.isEmpty) {
//         if (controller.arguments['type'] == "phone") {
//           if (mobileNumber.text.length == 10) {
//             controller.link(mobileNumber.text);
//           } else {
//             toast(AllStrings.enter_correct_mobile_num.tr);
//           }
//         } else {
//           controller.link(mobileNumber.text);
//         }
//       } else {
//         toast(AllStrings.enter_req_field.tr);
//       }
//     } else {
//       if (controller.isPasswordAvailable.value) {
//         if (mobileNumber.text.contains("@")) {
//           if (!password.text.isEmpty) {
//             Map data = {
//               "phone": mobileNumber.text.toString(),
//               "password": password.text.toString(),
//               "corporate": controller.isCorporate.value,
//               "fcm_token": getFcmToken()
//             };
//             print("from third: ${data}");
//             controller.loginApi(data, "password", context);
//           } else {
//             toast(AllStrings.enter_password.tr);
//           }
//         } else {
//           if (mobileNumber.text.length == 10) {
//             if (!password.text.isEmpty) {
//               Map data = {
//                 "phone": mobileNumber.text.toString(),
//                 "password": password.text.toString(),
//                 "corporate": controller.isCorporate.value,
//                 "fcm_token": getFcmToken()
//               };
//               print("from forth: ${data}");
//               controller.loginApi(data, "password", context);
//             } else {
//               toast(AllStrings.enter_password.tr);
//             }
//           } else {
//             toast(AllStrings.enter_correct_mobile_num.tr);
//           }
//         }
//       } else {
//         if (mobileNumber.text.contains("@")) {
//           print("entered 1");
//           Map data = {
//             "phone": mobileNumber.text.toString(),
//             "type": controller.signUp.value ? "REGISTER" : "RLOGIN",
//             "corporate": controller.isCorporate.value,
//             "fcm_token": getFcmToken()
//           };
//           print("from first: $data");

//           controller.loginApi(
//               data, controller.signUp.value ? "signup_otp" : "otp", context);
//         } else if (mobileNumber.text.length == 10) {
//           Map data = {
//             "phone": mobileNumber.text.toString(),
//             "type": controller.signUp.value ? "REGISTER" : "RLOGIN",
//             "corporate": controller.isCorporate.value,
//             "fcm_token": getFcmToken()
//           };
//           print("from second: $data");

//           controller.loginApi(
//               data, controller.signUp.value ? "signup_otp" : "otp", context);
//         } else {
//           print("entered 2");
//           toast(AllStrings.enter_correct_mobile_num.tr);
//         }
//       }
//     }
// /  }
//
}
