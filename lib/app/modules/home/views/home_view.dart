import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tezda_task/app/modules/favourates_page_view/controllers/favourates_page_view_controller.dart';
import 'package:tezda_task/app/modules/favourates_page_view/views/favourates_page_view_view.dart';
import 'package:tezda_task/app/modules/product_details_page/controllers/product_details_page_controller.dart';
import 'package:tezda_task/app/modules/product_details_page/views/product_details_page_view.dart';
import 'package:tezda_task/app/modules/products_page/controllers/products_page_controller.dart';
import 'package:tezda_task/app/modules/products_page/views/products_page_view.dart';
import 'package:tezda_task/app/modules/profile/controllers/profile_controller.dart';
import 'package:tezda_task/app/modules/profile/views/profile_view.dart';

import '../controllers/home_controller.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        List<Widget> _widgetOptions = <Widget>[
      ProductsPageView(),
      // ProductDetailsPageView(),
      ProfileView()
    ];
    return Obx(() {
        return Scaffold(
          body: _widgetOptions.elementAt(controller.index.value),
          
           bottomNavigationBar: SnakeNavigationBar.color(
                        behaviour: SnakeBarBehaviour.floating,
                        snakeShape: SnakeShape.indicator,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(48)),
                        ),
                        backgroundColor: Colors.black87,
                        snakeViewColor: Colors.black87,
                        height: 68,
                        elevation: 4,
                        selectedItemColor: SnakeShape.circle == SnakeShape.indicator
                            ? Colors.black87
                            : null,
                        unselectedItemColor: Colors.white,
                        selectedLabelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                        showUnselectedLabels: false,
                        showSelectedLabels: true,
                        currentIndex: controller.index.value,
                        onTap: (index) {
                          controller.index.value = index;
                          if(controller.index.value == 0){
                            Get.lazyPut(() => ProductsPageController());
                          }
                          else {
                            Get.lazyPut(() => ProfileController());
                          }
                        },
                     
                        items: const [
                          // BottomNavigationBarItem(
                          //     icon: ImageIcon(
                          //       AssetImage("assets/navbar_icons/home.png"),
                          //       color: Colors.white,
                          //       size: 26,
                          //     ),
                          //     activeIcon: Padding(
                          //       padding: EdgeInsets.all(5.0),
                          //       child: CircleAvatar(
                          //         backgroundColor: Colors.deepOrange,
                          //         maxRadius: 4,
                          //       ),
                          //     ),
                          //     label: 'Home'),
                          BottomNavigationBarItem(
                              icon: ImageIcon(
                                AssetImage("assets/navbar_icons/categories.png"),
                                color: Colors.white,
                                size: 26,
                              ),
                              activeIcon: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.deepOrange,
                                  maxRadius: 4,
                                ),
                              ),
                              label: 'Category'),
                          // BottomNavigationBarItem(
                          //     icon:Icon(Icons.favorite_border_rounded,color: Colors.white,size: 26,),
                          //     activeIcon: Padding(
                          //       padding: EdgeInsets.all(5.0),
                          //       child: CircleAvatar(
                          //         backgroundColor: Colors.deepOrange,
                          //         maxRadius: 4,
                          //       ),
                          //     ),
                          //     label: 'Favourates'),
                          BottomNavigationBarItem(
                              icon: ImageIcon(
                                AssetImage("assets/navbar_icons/user.png"),
                                color: Colors.white,
                                size: 26,
                              ),
                              activeIcon: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.deepOrange,
                                  maxRadius: 4,
                                ),
                              ),
                              label: 'Profile'),
                          // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search')
                        ],
                      )
                );
      }
    );
  }
}

