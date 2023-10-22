import 'package:al_quran/widget/home/header.dart';
import 'package:al_quran/widget/home/juz_card.dart';
import 'package:al_quran/widget/home/surah_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color.dart';
import '../util/background_app.dart';
import '../viewModel/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

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
              title: Text(
                "AL QUR'AN",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: CustomColor.textPrimaryColor, fontSize: 25),
              ),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  "assets/logo_alquran.png",
                ),
              ),
              leadingWidth: 70,
            ),
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Stack(children: [
                const BackgroundApp(),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: Image.asset("assets/bismillah.png")),
                        const SizedBox(
                          height: 20,
                        ),
                        const HomeHeader(),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            JuzCard(),
                            SizedBox(
                              width: 10,
                            ),
                            SurahCard()
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ));
  }
}
