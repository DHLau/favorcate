import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  FilterViewModel _filterVm = FilterViewModel();

  updateFilters(FilterViewModel filterVm) {
    _filterVm = filterVm;
  }

  List<MealModel> get meals {
    return _meals.where((meal) {
      if (_filterVm.isGlutenFree && !meal.isGlutenFree!) {
        return false;
      }
      if (_filterVm.isLactoseFree && !meal.isLactoseFree!) {
        return false;
      }
      if (_filterVm.isVegetarian && !meal.isVegetarian!) {
        return false;
      }
      if (_filterVm.isVegan && !meal.isVegan!) {
        return false;
      }
      return true;
    }).toList();
  }

  MealViewModel() {
    MealRequest.getMealsData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
