import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tezda_task/app/modules/splash_screen/controllers/splash_screen_controller.dart';


class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        print(controller.count);
        return Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[
             const Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Welcome")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                height: 2,
                child:const LinearProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        );
      }),
    );
  }
}
