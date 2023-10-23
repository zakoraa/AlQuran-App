import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/al_quran_model.dart';
import '../../theme/color.dart';
import '../../viewModel/home/home_controller.dart';

class ColumnJuzList extends StatelessWidget {
  const ColumnJuzList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    List<SurahAlQuran> items = homeController.dataList;
    return Column(
      children: List.generate(
          items.length,
          (index) => Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        height: 80,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColor.primaryColor),
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Juz ${index + 1}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: const Color.fromARGB(255, 0, 84, 82),
                                    fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Mekkah  •  7 Ayat",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: CustomColor.textsecondaryColor,
                                      fontSize: 12))
                        ],
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Arabnya",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: CustomColor.primaryColor),
                            )),
                      ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 1,
                      width: Get.width,
                      color: const Color.fromARGB(255, 212, 212, 212),
                    ),
                  )
                ],
              )),
    );
  }
}
