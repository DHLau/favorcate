import 'package:flutter/material.dart';

// 全屏的Drawer
class HomeAppBar extends AppBar {
  HomeAppBar(BuildContext context)
    : super(
        title: Text("美食广场"),
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      );
}

// class HomeAppBar extends AppBar {
//   HomeAppBar(BuildContext context)
//     : super(
//         title: Text("美食广场"),
//         leading: Builder(
//           builder: (context) {
//             return IconButton(
//               icon: Icon(Icons.menu),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       );
// }
