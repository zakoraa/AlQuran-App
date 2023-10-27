import 'package:al_quran/model/ayat_al_quran_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer;

  AudioController({required this.audioPlayer});

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  RxBool isAudio = false.obs;
  RxBool isPlaying = false.obs;
  RxBool isLoading = false.obs;
  RxBool isShown = false.obs;
  dynamic item;
  String? audioURL;
  List<AyatAlQuran>? ayatList;
  int index = 1;
  ItemScrollController itemScrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  Future<void> playAudio(dynamic item, String audioURL) async {
    isLoading.value = true;
    this.audioURL = audioURL;
    this.item = item;
    isShown.value = !isShown.value;
    item.isPlaying = isShown.value;
    update();
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
    if (item!.isPlaying) {
      if (item is AyatAlQuran) {
        index = item.ayatNumber;
      } else {
        index = item.surahId;
      }
      await audioPlayer.play(UrlSource(audioURL));
      isLoading.value = false;
    } else {
      await audioPlayer.pause();
      isLoading.value = false;
    }
    update();
  }

  Future<void> playNextAudio() async {
    if (index <= ayatList!.length - 1) {
      await playAudio(ayatList![index], ayatList![index].audio);
    }
  }

  Future<void> scrollToItem() async {
    final hasPrevious = itemPositionsListener.itemPositions.value
        .any((item) => item.index == 0);
    final hasNext = itemPositionsListener.itemPositions.value
        .any((item) => item.index == ayatList!.length - 1);
    final isValidPosition = !hasNext || !hasPrevious;

    //  itemScrollController.isAttached kalau auto scroll tampil di layar,
    //  fungsi dibawah akan dijalankan, agar saat keluar dari halaman
    //  tidak error
    if (itemScrollController.isAttached && isValidPosition) {
      itemScrollController.scrollTo(
        index: index - 1,
        duration: const Duration(milliseconds: 300),
      );
    }
    update();
  }

  void stopPlaying() {
    isShown.value = false;
    isPlaying.value = false;
    item.isPlaying = false;
    isLoading.value = false;
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
      if (item is AyatAlQuran) {
        scrollToItem();
      }
      update();
    });

    audioPlayer.onPlayerComplete.listen((event) async {
      stopPlaying();
      if (item is AyatAlQuran) {
        await playNextAudio();
      }
      update();
    });
  }
}
