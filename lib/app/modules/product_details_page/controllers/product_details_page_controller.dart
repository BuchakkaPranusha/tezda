import 'package:get/get.dart';
import 'package:tezda_task/app/providers/AllProviders.dart';
import 'package:tezda_task/app/providers/response_handler.dart';

class ProductDetailsPageController extends GetxController {
  //TODO: Implement ProductDetailsPageController

  final count = 0.obs;
  final selectedProductId = 0.obs;
  final dataFetched = false.obs;
  final addedtoFav = false.obs;
  final selectedProductData = {}.obs;
  @override
  void onInit() {
    if(Get.arguments != null){
      selectedProductId.value = Get.arguments['id'];
    }
    productsByID(selectedProductId.value);
    super.onInit();

  }

  productsByID(id) async {
    try {
      dataFetched.value = true;
      var res = await AllProviders().productsByID(id);
      isResponseNull(res);
      if(res.statusCode == 200){
        var response = res.body;
        print("productsByID response::::::::::::$response");
        selectedProductData.clear();
        selectedProductData.value = response;
      }
      dataFetched.value = false;
    } catch (e) {
      dataFetched.value = false;
      print('products by id fetchings Error : ${e}');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
