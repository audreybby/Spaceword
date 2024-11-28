import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CoinProvider with ChangeNotifier {
  int _coins = 2000;

  int get coins => _coins;

  CoinProvider() {
    _loadCoins(); // Memuat koin dari penyimpanan saat inisialisasi
  }

  // Menambahkan koin
  void addCoins(int amount) {
    _coins += amount;
    _saveCoins(); // Simpan perubahan koin ke penyimpanan
    notifyListeners();
  }

  // Mengurangi koin
  void subtractCoins(int amount) {
    if (_coins >= amount) {
      _coins -= amount;
      _saveCoins(); // Simpan perubahan koin ke penyimpanan
      notifyListeners();
    }
  }

  // Membeli skin dengan koin
  bool purchaseSkin(int price) {
    if (_coins >= price) {
      _coins -= price;
      _saveCoins(); // Simpan perubahan koin ke penyimpanan
      notifyListeners();
      return true; // Pembelian berhasil
    }
    return false; // Koin tidak cukup
  }

  // Mengonversi skor menjadi koin (contoh: 1 skor = 1 koin)
  void convertScoreToCoins(int score) {
    _coins += score;
    _saveCoins(); // Simpan perubahan koin ke penyimpanan
    notifyListeners();
  }

  // Reset jumlah koin ke nilai default
  void resetCoins() {
    _coins = 2000; // Nilai default
    _saveCoins(); // Simpan perubahan koin ke penyimpanan
    notifyListeners();
  }

  // Sinkronisasi koin dengan skor global
  void syncWithGlobalScore(int globalScore) {
    _coins = globalScore; // Ganti koin dengan skor global
    _saveCoins(); // Simpan perubahan koin ke penyimpanan
    notifyListeners();
  }

  // **Simpan jumlah koin ke SharedPreferences**
  void _saveCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('coins', _coins);
  }

  // **Muat jumlah koin dari SharedPreferences**
  void _loadCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _coins = prefs.getInt('coins') ??
        2000; // Gunakan nilai default 2000 jika belum ada data
    notifyListeners();
  }
}

class CharacterProvider with ChangeNotifier {
  String _selectedBody = 'assets/bodies/Alien Biru.png';
  String _selectedClothes = 'assets/clothes/KOSTUM PENCURI.png';

  String get selectedBody => _selectedBody;
  String get selectedClothes => _selectedClothes;

  // Update karakter dengan body dan baju baru
  void updateCharacter(String body, String clothes) {
    _selectedBody = body;
    _selectedClothes = clothes;
    notifyListeners();
  }
}
