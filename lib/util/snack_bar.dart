import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  static showSnackBarUtil(String text, int duration) {
    return Get.showSnackbar(GetSnackBar(
      animationDuration: const Duration(milliseconds: 500),
      duration: Duration(milliseconds: duration),
      messageText: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontFamily: "Poppins"),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 98, 87),
    ));
  }
}
