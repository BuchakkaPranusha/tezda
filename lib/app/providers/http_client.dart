import 'dart:io';
import 'package:get/get.dart';
import 'package:tezda_task/app/providers/response_handler.dart';


class HttpClient extends GetConnect {
  String? url = null;
  static String appVersion = '';

  HttpClient() {
    print('httpClient url : ${url}');
    // add your local storage here to load for every request
    // var token = getToken();
    // appInfo();
    //1.base_url
    httpClient.baseUrl = url;
    // print(httpClient.baseUrl);
    //2.defaultContentType
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 180);
    // if (int.parse(httpClient.timeout.toString()) > 15) {
    //   toast("This is taking longer than expected, Please wait");
    // } else if (int.parse(httpClient.timeout.toString()) >= 180) {
    //   toast("Something went wrong, Please try again later.");
    // }

    // Request Interceptor
    httpClient.addRequestModifier<dynamic>((request) async {
      // add request here
      // request.headers['Authorization'] = getToken();
      request.headers['platform'] = Platform.operatingSystem;
      // request.headers['appname'] = "co-tezda-task";
      // request.headers['version'] = appVersion;
      // print("version2 $appVersion");
      print(
          '\n----------------------------------------------------------------\n');
      print('URL : ${request.url.toString()}');
      // print('Headers :- ${request.headers.toString()}');
      // print('Body : ${request.bodyBytes.toString()}');
      return request;
    });

    // Response Interceptor
    httpClient.addResponseModifier((request, response) async {
      try {
        ResponseHandler(response);
        return response;
      } catch (e) {
        throw e;
      }
      // return response;
    });

    // var headers = {'Authorization': "$token", "version": "$appVersion",};
    var headers = {'Content-Type': 'application/json'};
    httpClient.addAuthenticator<dynamic>((request) async {
      request.headers.addAll(headers);
      return request;
    });

    super.onInit();
  }

  // appInfo() async {
  //   packageInfo = await PackageInfo.fromPlatform();
  //   appVersion = packageInfo.version;
  //   print("version1 $appVersion");
  // }
}
