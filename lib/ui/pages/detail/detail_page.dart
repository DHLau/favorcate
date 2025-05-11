import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/pages/detail/detail_content_page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "detail";

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mealModel = ModalRoute.of(context)?.settings.arguments as MealModel?;
    if (mealModel is! MealModel) {
      return Scaffold(body: Center(child: Text('参数错误')));
    }
    return Scaffold(
      appBar: AppBar(title: Text(mealModel.title ?? "")),
      body: DetailContentPage(mealModel),
    );
  }
}
