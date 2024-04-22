import 'package:flutter/material.dart';

dummyProfilePic(gender) {
  if (gender == "male") {
    return Image.asset(
      "assets/images/man.png",
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset(
      "assets/images/woman.png",
      fit: BoxFit.cover,
    );
  }
}
