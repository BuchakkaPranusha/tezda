import 'package:get/get.dart';
import 'package:tezda_task/app/modules/favourates_page_view/controllers/favourates_page_view_controller.dart';
import 'package:tezda_task/app/modules/products_page/controllers/products_page_controller.dart';
import 'package:tezda_task/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductsPageController>(
      () => ProductsPageController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
