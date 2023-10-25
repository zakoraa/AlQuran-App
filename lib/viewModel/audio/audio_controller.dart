import 'package:al_quran/model/surah_al_quran_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer;

  AudioController({required this.audioPlayer});

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  RxBool isPlaying = false.obs;
  RxBool isLoading = false.obs;
  RxBool isShown = false.obs;
  SurahAlQuran? item;
  String? audioURL;

  Future<void> playAudio(SurahAlQuran item, String audioURL) async {
    this.audioURL = audioURL;
    this.item = item;
    isShown.value = !isShown.value;
    item.isPlaying = isShown.value;
    await handlePlay(audioURL);
    update();
  }

  Future<void> onPlay(dynamic value) async {
    final newPosition = Duration(seconds: value.toInt());
    await audioPlayer.seek(newPosition);
    await audioPlayer.resume();
    update();
  }

  Future<void> handlePlay(String audioURL) async {
    isLoading.value = true;
    if (item!.isPlaying) {
      await audioPlayer.play(UrlSource(audioURL));
      isLoading.value = false;
    } else {
      await audioPlayer.pause();
      isLoading.value = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    audioPlayer.onPlayerStateChanged.listen((event) {
      isPlaying.value = event == PlayerState.playing;
      update();
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      duration = newDuration;
      update();
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      position = newPosition;
      update();
    });
  }
}
