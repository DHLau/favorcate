import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class DetailContentPage extends StatelessWidget {
  final MealModel _mealModel;

  const DetailContentPage(this._mealModel, {super.key});

  // 横幅图片
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_mealModel.imageUrl ?? ""),
    );
  }

  // 制作材料
  Widget buildMakeMeterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        // shrink缩小, Warp包裹, 缩小包裹.
        // 否则会报错, 滚动视图的父容器必须设置高度
        shrinkWrap: true,
        // 去掉内边距
        padding: EdgeInsets.all(0),
        // NeverScrollableScrollPhysics 禁止滚动
        physics: NeverScrollableScrollPhysics(),
        itemCount: _mealModel.ingredients?.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white70,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(_mealModel.ingredients?[index] ?? ""),
            ),
          );
        },
      ),
    );
  }

  // 制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              // 圆形头像
              child: Text("#${index + 1}"),
            ),
            title: Text(_mealModel.steps?[index] ?? ""),
          );
        },
        separatorBuilder: (context, index) {
          // 分割线
          return Divider(color: Colors.grey);
        },
        itemCount: _mealModel.steps?.length ?? 0,
      ),
    );
  }

  // 公共方法
  Widget buildMakeTitle(String string) {
    return Container(
      // 水平居中
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        string,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget buildMakeContent({
    required BuildContext context,
    required Widget child,
  }) {
    return Container(
      // 通过媒体查询, 设置宽度
      width: MediaQuery.of(context).size.width - 30,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle("制作材料"),
          buildMakeMeterial(context),
          buildMakeTitle("制作步骤"),
          buildMakeSteps(context),
        ],
      ),
    );
  }
}
