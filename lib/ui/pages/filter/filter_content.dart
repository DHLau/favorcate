import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [buildYourChoice(), buildChoiceSelect()]);
  }

  Widget buildYourChoice() {
    return Container(
      alignment: Alignment.center,
      child: Text("展示你的选择", style: TextStyle(fontSize: 20)),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      // 如果子组件不充满, 会被强制充满
      child: Consumer<FilterViewModel>(
        builder: (ctx, vm, child) {
          return ListView(
            children: [
              buildListTile("无谷蛋白", "不含谷蛋白的食物", vm.isGlutenFree, () {
                vm.isGlutenFree = !vm.isGlutenFree;
              }),
              buildListTile("无乳糖", "不含乳糖的食物", vm.isLactoseFree, () {
                vm.isLactoseFree = !vm.isLactoseFree;
              }),
              buildListTile("普通素食者", "普通素食者的食物", vm.isVegan, () {
                vm.isVegan = !vm.isVegan;
              }),
              buildListTile("严格素食者", "严格素食者的食物", vm.isVegetarian, () {
                vm.isVegetarian = !vm.isVegetarian;
              }),
            ],
          );
        },
      ),
    );
  }

  ListTile buildListTile(
    String title,
    String subTitle,
    bool value,
    Function onTap,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: value,
        onChanged: (value) {
          onTap();
        },
      ),
    );
  }
}
