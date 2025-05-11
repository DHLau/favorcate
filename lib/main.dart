import 'package:favorcate/core/router/route.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MealViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '爱美食',
      theme: ThemeData(
        // 去掉点击时候的波纹效果
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      // 路由
      initialRoute: DHRoute.initialRoute,
      onGenerateRoute: DHRoute.generateRoute,
      routes: DHRoute.routes,
      onUnknownRoute: DHRoute.unknownRoute,
    );
  }
}
