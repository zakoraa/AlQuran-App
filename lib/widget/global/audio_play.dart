import 'package:al_quran/viewModel/audio/audio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color.dart';

class AudioPlay extends StatelessWidget {
  const AudioPlay({super.key});

  @override
  Widget build(BuildContext context) {
    AudioController audioController = Get.find<AudioController>();

    return GetBuilder<AudioController>(
        builder: (_) => AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: audioController.isShown.value ? 0 : -100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 80,
                  width: Get.width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 53, 242, 214),
                            Color.fromARGB(255, 118, 174, 254),
                          ]),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                            color: Color.fromARGB(161, 157, 157, 157))
                      ]),
                  child: audioController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color:
                                                  CustomColor.textPrimaryColor,
                                              fontSize: 14),
                                    ),
                                  ),
                                  Expanded(
                                    child: Slider(
                                        max: audioController.duration.inSeconds
                                            .toDouble(),
                                        activeColor: Colors.white,
                                        inactiveColor: const Color.fromARGB(
                                            255, 229, 227, 227),
                                        min: 0,
                                        value: audioController
                                            .position.inSeconds
                                            .toDouble(),
                                        onChanged: (value) async {
                                          await audioController.onPlay(value);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async => await audioController
                                  .handlePlay(audioController.audioURL!),
                              child: SizedBox(
                                child: Icon(
                                  audioController.isPlaying.value
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ));
  }
}
