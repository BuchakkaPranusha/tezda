import 'package:get/get.dart';

import '../controllers/favourates_page_view_controller.dart';

class FavouratesPageViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouratesPageViewController>(
      () => FavouratesPageViewController(),
    );
  }
}
