import 'dart:convert';

import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/services.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoriseData() async {
    // 1. 加载json文件
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    // 2. 解析json文件
    final result = json.decode(jsonString);
    // 3. 封装成模型
    final resultList = result['category'];
    List<CategoryModel> categoryModelList = [];
    for (var item in resultList) {
      categoryModelList.add(CategoryModel.fromJson(item));
    }
    // 4. 提供数据
    return categoryModelList;
  }
}
