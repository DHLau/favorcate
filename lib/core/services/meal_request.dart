import 'dart:convert';

import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/services.dart';

class MealRequest {
  static Future<List<MealModel>> getMealsData() async {
    // 1. 加载json文件
    final jsonString = await rootBundle.loadString('assets/json/meal.json');
    // 2. 解析json文件
    final result = json.decode(jsonString);
    // 3. 封装成模型
    final resultList = result['meal'];
    List<MealModel> mealModelList = [];
    for (var item in resultList) {
      final model = MealModel.fromJson(item);
      mealModelList.add(model);
    }
    return mealModelList;
  }
}
