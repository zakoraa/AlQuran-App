import 'package:al_quran/viewModel/audio/audio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 70,
            width: Get.width,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 75, 235, 211),
                      Color.fromARGB(255, 117, 168, 239),
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
                ? const SizedBox(
                    height: 5,
                    width: 5,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Slider(
                            max: audioController.duration.inSeconds.toDouble(),
                            activeColor: Colors.white,
                            inactiveColor:
                                const Color.fromARGB(255, 229, 227, 227),
                            min: 0,
                            value:
                                audioController.position.inSeconds.toDouble(),
                            onChanged: (value) async {
                              await audioController.onPlay(value);
                            }),
                      ),
                      GestureDetector(
                        onTap: () async => await audioController.playAudio(
                            audioController.item!, audioController.audioURL!),
                        child: SizedBox(
                          child: Icon(
                            audioController.isPlaying.value
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
