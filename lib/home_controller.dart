import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';

class MusicController extends GetxController {
  // final AudioPlayer _player = AudioPlayer();
  var currentSong = ''.obs;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Additional initialization if needed
  }

  // Future<void> loadMusicFromFile(String filePath) async {
  //   try {
  //     await _player.setFilePath(filePath);
  //     currentSong.value = filePath;
  //   } catch (e) {
  //     // Handle error
  //     print("Error loading music: $e");
  //   }
  // }

  // void play() {
  //   _player.play();
  //   isPlaying.value = true;
  // }

  // void pause() {
  //   _player.pause();
  //   isPlaying.value = false;
  // }

  // void stop() {
  //   _player.stop();
  //   isPlaying.value = false;
  // }

  @override
  void onClose() {
    // _player.dispose();
    super.onClose();
  }
}
