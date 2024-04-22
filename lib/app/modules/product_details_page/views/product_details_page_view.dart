import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tezda_task/app/constants/colors.dart';
import 'package:tezda_task/app/modules/favourates_page_view/controllers/favourates_page_view_controller.dart';
import 'package:tezda_task/app/modules/favourates_page_view/views/favourates_page_view_view.dart';

import '../controllers/product_details_page_controller.dart';

class ProductDetailsPageView extends GetView<ProductDetailsPageController> {
  const ProductDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ProductDetailsPageView'),
            centerTitle: true,
              actions: [
              TextButton(onPressed: (){
                Get.to(() =>const FavouratesPageViewView());
              }, child: const Text("Favourtes"))
            ],
          ),
          body:!controller.dataFetched.value? Column(
            children: [
              controller.selectedProductData.isNotEmpty
              ? Container(
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
                child: Column(
                  children: [
                     Center(
                child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        child: Container(
                            height: Get.height *0.2,
                            width: Get.width,
                            child: controller.selectedProductData['images'] == null
                            ? SizedBox()
                                : Row(
                                  children: List.generate(controller.selectedProductData['images'].length, (index) => 
                                    CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        imageUrl: "${controller.selectedProductData[index]}",
                                        placeholder: (context, url) => SizedBox(),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ))
                                ))),
              ),
              
                    ListTile(
                      onTap: (){
                        controller.addedtoFav.value = !controller.addedtoFav.value;
                        FavouratesPageViewController favouratesPageViewController = Get.put(FavouratesPageViewController());
                        var list = favouratesPageViewController.favList;
                       var data =  {
                            'id':controller.selectedProductData['id'],
                            "title ":controller.selectedProductData['title'],
                            'description' :controller.selectedProductData['description'],
                            'images': controller.selectedProductData['images']
                          };
                          list.add(data); 
                      },
                      title: Text( controller.selectedProductData['title'],style: const TextStyle(color: mainColor,fontSize: 18),),
                      subtitle: Text( controller.selectedProductData['description'],style:const TextStyle(color: grayColor,fontSize: 12),),
                      trailing: controller.addedtoFav.value ?Icon(Icons.favorite) :Icon(Icons.favorite_border_rounded),
                    ),
                  ],
                ),
              ): Padding(
                padding: const EdgeInsets.all(54),
                child: Center(child: Text("Product data not found!, try again")),
              ),
            ],
          ):Padding(
                padding: const EdgeInsets.all(54),
            child: Center(child: CircularProgressIndicator()),
          )
        );
      }
    );
  }
}
