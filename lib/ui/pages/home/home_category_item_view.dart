import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class HomeCategroyItemView extends StatelessWidget {
  final CategoryModel _model;
  const HomeCategroyItemView(this._model, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorInt = int.parse(_model.color ?? "ffffff", radix: 16);
    final cColor = Color(colorInt | 0xff000000);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: cColor,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            // 颜色渐变
            colors: [
              cColor.withValues(alpha: 0.5),
              cColor.withValues(alpha: 1.0),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(_model.title ?? ""),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(MealPage.routeName, arguments: _model);
      },
    );
  }
}
