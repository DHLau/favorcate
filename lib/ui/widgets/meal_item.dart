import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail_page.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const radius = Radius.circular(12);

class MealItemPage extends StatelessWidget {
  final MealModel _mealModel;

  const MealItemPage(this._mealModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(radius)),
        child: Column(
          children: [buildBasicInfo(context), buildOperationInfo()],
        ),
      ),
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(DetailPage.routeName, arguments: _mealModel);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 进行裁剪
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
          child: Image.network(
            _mealModel.imageUrl ?? "",
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 5,
          child: Container(
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              _mealModel.title ?? "",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOperationInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
        OperationItem(Icon(Icons.restaurant), "${_mealModel.complexity}"),
        buildFavorItem(),
      ],
    );
  }

  Widget buildFavorItem() {
    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child) {
        return GestureDetector(
          child: OperationItem(
            Icon(
              favorVM.isFavor(_mealModel)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            favorVM.isFavor(_mealModel) ? "收藏" : "未收藏",
          ),
          onTap: () {
            favorVM.handleFavor(_mealModel);
          },
        );
      },
    );
  }
}
