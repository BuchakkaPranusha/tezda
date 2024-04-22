import 'package:get/get.dart';
import 'package:tezda_task/app/helpers/toasst.dart';
import 'package:tezda_task/app/helpers/authorization_helper.dart';

dynamic ResponseHandler(Response response) {
  print("Res Handler : ${response.statusCode}");
  var resp = response.body;
  int? code = response.statusCode;

  if (code! >= 200 && code <= 299) {
    return response;
  } else if (code >= 300 && code <= 399) {
    throw 'REDIRECT';
  } else if (code >= 401 && code <= 403) {
    if ((resp as Map).containsKey("message")) {
      toast(resp['message']);
    } else {
      toast("Un authorized, Log in again");
    }
    unAuthorized();
    throw 'UNAUTHORIZED';
  } else if (code == 400 || code >= 404 && code <= 499) {
    print("400: ${resp['message'].contains("account is currently inactive,")}");

    if (resp['message'].contains("account is currently inactive,") ||
        resp['message'].contains("1") ||
        resp['message'].contains("deactivated.") ||
        resp['message'].contains("2")) {
      throw '555 ${resp['message']}';
    } else {
      toast(resp['message']);
      throw 'BAD_REQUEST';
    }
  } else if (code >= 500 && code <= 599) {
    toast(resp['message']);
    throw 'INTERNAL_SERVER_ERROR';
  } else {
    if (response == null) {
      toast("Please check your internet connection, try later");
      throw 'NETWORK_DISCONNECTED';
    }
  }
}

// isResponseNull(response) {
//   if (isNull(response)) {
//     toast('Please check your internet connection & try again.');
//     throw 'NO_RESPONSE';
//   }
// }

isResponseNull(Response resp, {bool goBack = false, message = null}) {
  if (resp.status.connectionError) {
    var customMessage = "Please check your internet connection, try later";
    print("${message}");
    customMessage = message != null ? message : customMessage;
    print("${customMessage}");
    toast(customMessage);
    if (goBack) {
      Get.back();
    }
    throw {"message": customMessage, "goBack": goBack};
  } else {
    return;
  }
}
