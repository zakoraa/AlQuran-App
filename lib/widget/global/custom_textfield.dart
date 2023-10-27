import 'package:al_quran/viewModel/surahView/surah_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    SurahController searchController = Get.find<SurahController>();
    return GetBuilder<SurahController>(
        builder: (_) => TextField(
              controller: searchController.searchText,
              onChanged: searchController.onSearch,
              cursorColor: const Color.fromARGB(255, 228, 228, 228),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white),
              decoration: InputDecoration(
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 228, 228, 228)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  filled: true,
                  fillColor: const Color.fromARGB(145, 0, 0, 0),
                  suffixIcon: GestureDetector(
                    onTap: () => searchController.onClear(),
                    child: const Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 228, 228, 228),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                  hintText: "Cari berdasarkan surah...",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none)),
            ));
  }
}
