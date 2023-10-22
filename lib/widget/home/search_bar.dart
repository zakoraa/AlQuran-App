import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/search.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Material(
        color: const Color.fromARGB(54, 0, 0, 0),
        borderRadius: BorderRadius.circular(30),
        elevation: 0.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          splashColor: const Color.fromARGB(111, 118, 235, 173),
          highlightColor: Colors.transparent,
          onTap: () => Get.to(() => const SearchView(),
              transition: Transition.rightToLeft),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.white, size: 20),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Cari Berdasarkan Surah...",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
