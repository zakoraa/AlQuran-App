import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:al_quran/theme/color.dart';
import 'package:al_quran/util/loading.dart';
import 'package:al_quran/viewModel/surahDetail/surah_detail_controller.dart';
import 'package:al_quran/widget/global/ayat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahDetailView extends StatefulWidget {
  const SurahDetailView(
      {super.key, required this.surahId, required this.surahName});

  final int surahId;
  final String surahName;

  @override
  State<SurahDetailView> createState() => _SurahDetailViewState();
}

class _SurahDetailViewState extends State<SurahDetailView> {
  SurahDetailController surahDetailController =
      Get.put(SurahDetailController());
  List<AyatAlQuran>? dataList;
  @override
  void initState() {
    surahDetailController.getAyatData(widget.surahId);
    dataList = surahDetailController.ayatDataList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => surahDetailController.isLoading.value
        ? const LoadingUtil()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromARGB(255, 204, 254, 233),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                widget.surahName,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: CustomColor.textPrimaryColor, fontSize: 20),
              ),
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: CustomColor.textPrimaryColor,
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  widget.surahId == 1
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: Get.width,
                                    color:
                                        const Color.fromARGB(255, 31, 202, 128),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        10,
                                        (index) => Transform.rotate(
                                          angle: 0.76,
                                          child: Container(
                                            height: 5,
                                            width: 5,
                                            color: const Color.fromARGB(
                                                255, 204, 254, 233),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: Get.width,
                                child: Center(
                                  child: Image.asset(
                                    "assets/bismillah.png",
                                    width: 250,
                                  ),
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: Get.width,
                                    color:
                                        const Color.fromARGB(255, 31, 202, 128),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: List.generate(
                                        10,
                                        (index) => Transform.rotate(
                                          angle: 0.76,
                                          child: Container(
                                            height: 5,
                                            width: 5,
                                            color: const Color.fromARGB(
                                                255, 204, 254, 233),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dataList!.length,
                    itemBuilder: (context, index) => AyatList(index: index),
                  ),
                ],
              ),
            ),
          ));
  }
}
