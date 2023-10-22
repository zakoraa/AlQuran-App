import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color.dart';
import '../viewModel/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.put(HomeController());

    return Obx(() => homeController.isLoading.value
        ? Scaffold(
            body: SizedBox(
                height: Get.height,
                width: Get.width,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: CustomColor.secondaryColor,
                ))))
        : Scaffold(
            appBar: AppBar(
              title: const Text("Al Qur'an"),
            ),
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: SingleChildScrollView(
                child: Stack(children: [
                  Container(
                    height: 250,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: CustomColor.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                 
                ]),
              ),
            ),
          ));
  }
}
