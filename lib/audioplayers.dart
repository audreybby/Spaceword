import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Memutar musik latar
  Future<void> playBackgroundMusic(String filePath) async {
    try {
      await _audioPlayer.play(AssetSource(filePath));
      _audioPlayer
          .setReleaseMode(ReleaseMode.loop); // Musik akan terus berulang
      print('Musik latar berhasil diputar!');
    } catch (e) {
      print('Gagal memutar musik latar: $e');
    }
  }

  // Memberhentikan musik
  Future<void> stopMusic() async {
    try {
      await _audioPlayer.stop();
      print('Musik dihentikan!');
    } catch (e) {
      print('Gagal menghentikan musik: $e');
    }
  }

  // Dispose resources
  void dispose() {
    _audioPlayer.dispose();
  }
}
