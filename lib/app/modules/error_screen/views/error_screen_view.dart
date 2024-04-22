import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_task/app/helpers/toasst.dart';
import 'package:tezda_task/app/modules/error_screen/controllers/error_screen_controller.dart';
import 'package:tezda_task/app/widgets/no_internet.dart';

class ErrorScreenView extends GetView<ErrorScreenController> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        toast("Tap again to close the App");
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('ErrorScreenView'),
        //   centerTitle: true,
        // ),
        body: Center(
          child: NoInternet(
              "You're offline",
              "Please Connect to Internet",
              "assets/lotties/no_connection.json"),
        ),
      ),
    );
  }
}
