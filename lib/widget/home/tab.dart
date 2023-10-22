import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color.dart';
import '../../viewModel/home/home_tab_controller.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeTabController homeTabController = Get.find<HomeTabController>();
    List tabs = ["Surah", "Juz"];
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          GetBuilder<HomeTabController>(
            builder: (controller) => Row(
                children: List.generate(
              tabs.length,
              (index) => GestureDetector(
                onTap: () => homeTabController.selectTab(index),
                child: Column(
                  children: [
                    Text(
                      tabs[index],
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          color: index == homeTabController.selectedTab.value
                              ? CustomColor.primaryColor
                              : CustomColor.textsecondaryColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 1,
                      width: Get.width * 0.5 - 20,
                      color: index == homeTabController.selectedTab.value
                          ? CustomColor.primaryColor
                          : const Color.fromARGB(255, 212, 212, 212),
                    )
                  ],
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
