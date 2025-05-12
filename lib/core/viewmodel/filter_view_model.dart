import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  // 无谷蛋白
  bool _isGlutenFree = false;
  // 无乳糖
  bool _isLactoseFree = false;
  // 素食
  bool _isVegetarian = false;
  // 严格速食主义
  bool _isVegan = false;

  bool get isGlutenFree => _isGlutenFree;
  bool get isLactoseFree => _isLactoseFree;
  bool get isVegetarian => _isVegetarian;
  bool get isVegan => _isVegan;

  set isGlutenFree(bool isGlutenFree) {
    _isGlutenFree = isGlutenFree;
    notifyListeners();
  }

  set isLactoseFree(bool isLactoseFree) {
    _isLactoseFree = isLactoseFree;
    notifyListeners();
  }

  set isVegetarian(bool isVegetarian) {
    _isVegetarian = isVegetarian;
    notifyListeners();
  }

  set isVegan(bool isVegan) {
    _isVegan = isVegan;
    notifyListeners();
  }
}
