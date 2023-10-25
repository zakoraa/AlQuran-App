import 'package:al_quran/util/loading.dart';
import 'package:al_quran/widget/home/header.dart';
import 'package:al_quran/widget/home/al_quran_card.dart';
import 'package:al_quran/widget/home/tafsir_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color.dart';
import '../util/background_app.dart';
import '../viewModel/home/home_controller.dart';
import '../widget/home/al_quran_with_audio.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(() => homeController.isLoading.value
        ? const Scaffold(body: LoadingUtil())
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "AL QUR'AN",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: CustomColor.textPrimaryColor, fontSize: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: AlQuranCard()),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: TafsirCard(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const AlQuranWithAudioCard(),
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
