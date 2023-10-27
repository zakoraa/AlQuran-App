import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModel/audio/audio_controller.dart';

class AudioPlayButton extends StatelessWidget {
  const AudioPlayButton({
    super.key,
    required this.item,
    required this.audio,
  });

  final dynamic item;
  final String audio;

  @override
  Widget build(BuildContext context) {
    AudioController audioController = Get.find<AudioController>();
    return GetBuilder<AudioController>(
        builder: (_) => audioController.isAudio.value
            ? Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 117, 168, 239),
                          Color.fromARGB(255, 75, 235, 211),
                        ]),
                    borderRadius: BorderRadius.circular(5)),
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    overlayColor: const MaterialStatePropertyAll(
                      Color.fromARGB(112, 117, 168, 239),
                    ),
                    onTap: audioController.isPlaying.value ||
                            audioController.isLoading.value
                        ? () {}
                        : () async {
                            await audioController.playAudio(item, audio);
                          },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      width: Get.width,
                      color: Colors.transparent,
                      child: audioController.isLoading.value
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.isPlaying ? "Sebentar ya..." : "Audio",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 244, 243, 243)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                item.isPlaying
                                    ? const SizedBox.shrink()
                                    : const Icon(
                                        Icons.play_arrow,
                                        color:
                                            Color.fromARGB(255, 244, 243, 243),
                                        size: 20,
                                      ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.isPlaying
                                      ? "Sedang diputar..."
                                      : "Audio",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 14,
                                          color: const Color.fromARGB(
                                              255, 244, 243, 243)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                item.isPlaying
                                    ? const SizedBox.shrink()
                                    : const Icon(
                                        Icons.play_arrow,
                                        color:
                                            Color.fromARGB(255, 244, 243, 243),
                                        size: 20,
                                      ),
                              ],
                            ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink());
  }
}
