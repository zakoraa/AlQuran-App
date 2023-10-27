import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'theme/theme.dart';
import 'util/scroll_behavior.dart';
import 'view/home.dart';
import 'viewModel/home/home_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  HomeController homeController = Get.put(HomeController());

  if (!homeController.isLoading.value) {
      FlutterNativeSplash.remove();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehaviorUtils().copyWith(overscroll: false),
          child: child!,
        );
      },
      theme: CustomTheme.lightTheme,
      home: const HomeView(),
    );
  }
}
