import 'dart:convert';

import 'package:get/get.dart';
import 'package:tezda_task/app/helpers/toasst.dart';
import 'package:tezda_task/app/helpers/storage.dart';
import 'package:tezda_task/app/routes/app_pages.dart';



setProfile(profileDetails) {
  Storage.writeString("ProfileDetails", json.encode(profileDetails));
  print("profile details has been set");
}

getProfile() {
  return 
      json.decode(Storage.readString("ProfileDetails"));
}

setToken(String token) {
  Storage.writeString("Token", "Bearer " + token);
}

//getToken() returns with bearer
//getToken(false) returns without bearer
String getToken([bool bearer = true]) {
  if (bearer) {
    return Storage.readString("Token");
  } else {
    return Storage.readString("Token").split(" ")[1];
  }
}
setOnBoarding(bool value) {
  Storage.writeBoolean("OnBoarding", value);
}

bool getOnBoarding() {
  return Storage.readBoolean("OnBoarding");
}

//If 401 response redirect to Login with clearing local storage
unAuthorized() {
  toast("Un authorized, Log in Again");
  Storage.clearAllData();
  Get.offAllNamed(Routes.LOGIN_PAGE);
}

//custom header function used for api calls
customHeader() {
  return {
    // "Accept": "application/json",
    "Content-Type": "application/json",
    // "Authorization": getToken()
  };
}
