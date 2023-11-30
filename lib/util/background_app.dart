import 'package:flutter/material.dart';
import '../theme/color.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            CustomColor.primaryColor,
            Color.fromARGB(255, 180, 255, 223),
            Colors.white,
            Colors.white,
          ])),
    );
  }
}
