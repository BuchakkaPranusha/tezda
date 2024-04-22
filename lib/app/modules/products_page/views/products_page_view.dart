import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tezda_task/app/constants/colors.dart';
import 'package:tezda_task/app/modules/favourates_page_view/views/favourates_page_view_view.dart';
import 'package:tezda_task/app/routes/app_pages.dart';

import '../controllers/products_page_controller.dart';

class ProductsPageView extends GetView<ProductsPageController> {
  const ProductsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ProductsPageView'),
            centerTitle: true,
          
          ),
          body: SingleChildScrollView(
            child: !controller.dataFetched.value?Column(
              children: [
               (controller.productsList.length > 0)
                ? ListView.builder(
              itemCount: controller.productsList.length,
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return  InkWell(
                  onTap: (){
                    print("selected product id...${controller.productsList[index]['id'].toString()}");
                    Get.toNamed(Routes.PRODUCT_DETAILS_PAGE,arguments: {"id": controller.productsList[index]['id']});
                  },
                  child: Container(
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
                      title: Text( controller.productsList[index]?['title']?? "--",style: const TextStyle(color: mainColor,fontSize: 18),),
                      subtitle: Text( controller.productsList[index]['description'],style:const TextStyle(color: grayColor,fontSize: 12),),
                    ),
                  ),
                );
              })
              :Padding(
                padding: const EdgeInsets.all(64.0),
                child: Center(child: Text("No data found!",style: TextStyle(color: darkGrayColor,fontSize: 14),)),
              )
              ],
            ):const Padding(
              padding: EdgeInsets.all(64.0),
              child:  Center(child: CircularProgressIndicator()),
            ),
          ),
        
        );
      }
    );
  }
}
