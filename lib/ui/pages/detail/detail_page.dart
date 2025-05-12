import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail_content_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      floatingActionButton: Consumer<FavorViewModel>(
        builder: (ctx, favorVM, child) {
          return FloatingActionButton(
            child: Icon(
              favorVM.isFavor(mealModel)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            onPressed: () {
              favorVM.handleFavor(mealModel);
            },
          );
        },
      ),
    );
  }
}
