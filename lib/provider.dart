import 'package:flutter/material.dart';

class CoinProvider with ChangeNotifier {
  int _coins = 3090;

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
