import 'package:al_quran/theme/color.dart';
import 'package:flutter/material.dart';

abstract class AlertDialogUtils {
  static void showDialogUtils(BuildContext context,
      {required title, required actions, required content}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: CustomColor.backgroundColor,
              title: title,
              scrollable: true,
              content: content,
              actions: actions);
        });
  }
}
