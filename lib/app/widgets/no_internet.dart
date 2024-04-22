import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget NoInternet(String title, subTitile, String img) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          img,
          width: 250,
          height: 250,
        ),
        const SizedBox(height:10),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: "Poppins-Medium"),
        ),
        const SizedBox(height: 10),
        Text(
          subTitile,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ],
    ),
  );
}
