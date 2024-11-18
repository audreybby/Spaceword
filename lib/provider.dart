import 'package:flutter/material.dart';

class CoinProvider with ChangeNotifier {
  int _coins = 2000;

  int get coins => _coins;

  get playerCoins => 0;

  void addCoins(int amount) {
    _coins += amount;
    notifyListeners();
  }

  void subtractCoins(int amount) {
    if (_coins >= amount) {
      _coins -= amount;
      notifyListeners();
    }
  }

  bool purchaseSkin(int price) {
    if (_coins >= price) {
      _coins -= price;
      notifyListeners();
      return true;
    }
    return false;
  }
}

class CharacterProvider with ChangeNotifier {
  String _selectedBody = 'assets/bodies/Alien Biru.png';
  String _selectedClothes = 'assets/clothes/KOSTUM PENCURI.png';

  String get selectedBody => _selectedBody;
  String get selectedClothes => _selectedClothes;

  void updateCharacter(String body, String clothes) {
    _selectedBody = body;
    _selectedClothes = clothes;
    notifyListeners();
  }
}
