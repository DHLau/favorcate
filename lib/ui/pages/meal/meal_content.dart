import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealContentPage extends StatelessWidget {
  const MealContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return Selector<MealViewModel, List<MealModel>>(
      selector: (ctx, mealVM) {
        return mealVM.meals.where((meal) {
          return meal.categories!.contains(category.id);
        }).toList();
      },
      // 不相等的时候, 进行重新build
      shouldRebuild: (pre, next) => !listEquals(pre, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return MealItemPage(meals[index]);
          },
        );
      },
    );
  }
}

// class MealContentPage extends StatefulWidget {
//   const MealContentPage({super.key});

//   @override
//   State<MealContentPage> createState() => _MealContenPageState();
// }

// class _MealContenPageState extends State<MealContentPage> {
//   @override
//   Widget build(BuildContext context) {
//     final category =
//         ModalRoute.of(context)?.settings.arguments as CategoryModel;
//     return Consumer<MealViewModel>(
//       builder: (context, mealVm, chaild) {
//         final meals =
//             mealVm.meals.where((meal) {
//               if (meal.categories == null) {
//                 return false;
//               } else {
//                 return meal.categories!.contains(category.id ?? "");
//               }
//             }).toList();
//         return Container(color: Colors.red);
//       },
//     );
//   }
// }
