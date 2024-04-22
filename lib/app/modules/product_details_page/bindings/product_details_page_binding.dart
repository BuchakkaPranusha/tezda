import 'package:get/get.dart';

import '../controllers/product_details_page_controller.dart';

class ProductDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsPageController>(
      () => ProductDetailsPageController(),
    );
  }
}
