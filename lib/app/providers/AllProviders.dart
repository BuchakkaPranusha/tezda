import 'package:tezda_task/app/providers/http_client.dart';
import 'package:get/get.dart';
import 'package:tezda_task/app/constants/apis.dart';


class AllProviders extends HttpClient {
  String? url = Apis.base_url;

   Future<Response> login(Map data) async {
    final response = await post(Apis.login, data);
    return response;
  }

   Future<Response> getAllProducts() async {
    final response = await get(Apis.getAllProducts);
    return response;
  }

   Future<Response> productsByID(id) async {
    final response = await get(Apis.getAllProducts + "/$id");
    return response;
  }
   Future<Response> productsBySearch(search) async {
    final response = await get(Apis.getAllProducts + "/search?q=$search");
    return response;
  }


}

