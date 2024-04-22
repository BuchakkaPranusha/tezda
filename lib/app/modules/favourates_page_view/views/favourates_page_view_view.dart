import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tezda_task/app/constants/colors.dart';

import '../controllers/favourates_page_view_controller.dart';

class FavouratesPageViewView extends GetView<FavouratesPageViewController> {
  const FavouratesPageViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        print("favListtttt.....${controller.favList}");
        return Scaffold(
          appBar: AppBar(
            title: const Text('FavouratesPageView'),
            centerTitle: true,
          ),
          body:(controller.favList.isNotEmpty && controller.favList.length>0)
            ? ListView.builder(
          itemCount: controller.favList.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return  Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(3, 3),
                  color: Colors.black.withOpacity(0.1)
                )
              ]
              ),
              child: ListTile(
                title: Text( controller.favList[index]['title'] ?? "--",style: const TextStyle(color: mainColor,fontSize: 18),),
                subtitle: Text( controller.favList[index]['description'] ?? "--",style:const TextStyle(color: grayColor,fontSize: 12),),
              ),
            );
          })
          :const Padding(
            padding:  EdgeInsets.all(64.0),
            child: Center(child: Text("No data found!",style: TextStyle(color: darkGrayColor,fontSize: 14),)),
          )
        );
      }
    );
  }
}
