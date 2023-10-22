import 'package:al_quran/widget/home/header.dart';
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
              title: Center(
                  child: Text(
                "AL QUR'AN",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: CustomColor.textPrimaryColor, fontSize: 25),
              )),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 250,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                          color: CustomColor.shadowColor)
                                    ],
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF87E9DA),
                                          Color(0xFFA1C5F6),
                                        ])),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/al_quran_2.png",
                                        width: 100,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Juz",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontSize: 30,
                                                    color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 200,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 2,
                                          spreadRadius: 1,
                                          offset: Offset(0, 3),
                                          color: CustomColor.shadowColor)
                                    ],
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Color(0xFFDE88AD),
                                          Color(0xFFE2A8CB)
                                        ])),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/al_quran.png",
                                        width: 100,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Surah",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontSize: 30,
                                                    color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
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
