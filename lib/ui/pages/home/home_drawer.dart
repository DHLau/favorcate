import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 200,
        child: Drawer(
          child: Column(
            children: [
              buildHeaderView(),
              buildListTile(Icon(Icons.food_bank), "美食", () {
                Navigator.of(context).pop(); // 关闭drawer
              }),
              buildListTile(Icon(Icons.settings), "过滤", () {
                // 这里是Modal的方式打开新页面, 详细看路由的地方
                Navigator.of(context).pushNamed(FilterPage.routeName);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderView() {
    return Container(
      height: 100,
      // 让子元素居中
      alignment: Alignment(0, 0.5),
      width: double.infinity,
      color: Colors.blue,
      child: Text("开始动手", style: TextStyle(color: Colors.white, fontSize: 30)),
    );
  }

  Widget buildListTile(Widget icon, String text, Function() onTap) {
    return ListTile(leading: icon, title: Text(text), onTap: onTap);
  }
}
