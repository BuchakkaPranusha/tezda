import 'package:get/get.dart';
import 'package:tezda_task/app/providers/AllProviders.dart';
import 'package:tezda_task/app/providers/response_handler.dart';

class ProductsPageController extends GetxController {
  //TODO: Implement ProductsPageController

  final count = 0.obs;
  final dataFetched = false.obs;
  final productsList = [].obs;
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

getAllProducts() async {
    try {
      dataFetched.value = true;
      var res = await AllProviders().getAllProducts();
      isResponseNull(res);
      if(res.statusCode == 200){
        var response = res.body;
        print(" response::::::::::::$response");
        print("products length::::::::::::${response['products'].length}");
        productsList.clear();
        productsList.addAll(response['products']);
      }
      dataFetched.value = false;
    } catch (e) {
      dataFetched.value = false;
      print('products fetchings Error : ${e}');
    }
  }

productsBySearch(search) async {
    try {
      dataFetched.value = true;
      var res = await AllProviders().productsBySearch(search);
      isResponseNull(res);
      if(res.statusCode == 200){
        var response = res.body;
        print(" response::::::::::::$response");
        print("products length::::::::::::${response['products'].length}");
        productsList.clear();
        productsList.addAll(response['products']);
      }
      dataFetched.value = false;
    } catch (e) {
      dataFetched.value = false;
      print('products by search fetchings Error : ${e}');
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
