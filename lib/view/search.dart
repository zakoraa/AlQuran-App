import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/al_quran_model.dart';
import '../theme/color.dart';
import '../viewModel/search/search_controller.dart';
import '../widget/global/surah_list.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchViewController searchController = Get.put(SearchViewController());
    List<AlQuran> items = searchController.searchResults;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text("Pencarian"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 20),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: GetBuilder<SearchViewController>(
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
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      filled: true,
                      fillColor: const Color.fromARGB(54, 0, 0, 0),
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
                          borderSide: const BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 228, 228, 228)))),
                ),
              ),
            ),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        height: Get.height,
        child: GetBuilder<SearchViewController>(
          builder: (_) => items.isEmpty
              ? SizedBox(
                  width: Get.width,
                  child: Center(
                    child: Text(
                      "Pencarian Kosong",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: CustomColor.textsecondaryColor, fontSize: 16),
                    ),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) => SurahList(
                    index: index,
                    items: items,
                  ),
                ),
        ),
      ),
    );
  }
}
