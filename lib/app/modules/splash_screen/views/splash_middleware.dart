import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tezda_task/app/helpers/authorization_helper.dart';
import 'package:tezda_task/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';



class SplashMiddleware extends GetMiddleware {
  @override
  int get priority => 1;
  String currentRoute = "";
  final result = {}.obs;

  @override
  RouteSettings? redirect(String? route) {
    // print("redirect");
    // return RouteSettings(name: Routes.ADD_FAMILY_MEMBER);
    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    // print("Splash onPageCalled");
    // print("OnPageCalled");

    _loadScreen();

    return super.onPageCalled(page);
  }

  _loadScreen() async {
    print("Splash loadScreen");
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (!isConnected) {
      print("isConnected false Splash: ");
      print(Get.currentRoute);
      print(isConnected);
      if (Get.currentRoute != Routes.ERROR_SCREEN) {
        currentRoute = Get.currentRoute;
        Get.toNamed(Routes.ERROR_SCREEN);
      }
    } else {
      print("Splash Net Connected:");

      print(getOnBoarding());

      if (getOnBoarding() == false) {
        Get.offAllNamed(Routes.LOGIN_PAGE);
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  //This function will be called right before the Bindings are initialized.
  // Here we can change Bindings for this page.
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return super.onBindingsStart(bindings);
  }

  //This function will be called right after the Bindings are initialized.
  // Here we can do something after  bindings created and before creating the page widget.
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    return super.onPageBuildStart(page);
  }

  // Page build and widgets of page will be shown
  @override
  Widget onPageBuilt(Widget page) {
    return super.onPageBuilt(page);
  }

  //This function will be called right after disposing all the related objects
  // (Controllers, views, ...) of the page.
  @override
  void onPageDispose() {
    super.onPageDispose();
  }
}
