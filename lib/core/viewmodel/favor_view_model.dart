import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class FavorViewModel extends ChangeNotifier {
  List<MealModel> _favorMeals = [];

  // get方法
  List<MealModel> get favorMeals => _favorMeals;

  void add(MealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void remove(MealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  bool isFavor(MealModel meal) {
    return _favorMeals.contains(meal);
  }

  void handleFavor(MealModel meal) {
    isFavor(meal) ? remove(meal) : add(meal);
  }
}
