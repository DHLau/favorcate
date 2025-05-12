import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavorContentPage extends StatelessWidget {
  const FavorContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (context, vm, child) {
        if (vm.favorMeals.isEmpty) {
          return Center(child: Text('暂无收藏'));
        }
        return ListView.builder(
          itemCount: vm.favorMeals.length,
          itemBuilder: (itemContext, index) {
            return MealItemPage(vm.favorMeals[index]);
          },
        );
      },
    );
  }
}
