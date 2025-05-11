import 'package:favorcate/ui/pages/detail/detail_page.dart';
import 'package:favorcate/ui/pages/favor/favorpage.dart';
import 'package:favorcate/ui/pages/home/home.dart';
import 'package:favorcate/ui/pages/main/MainScreen.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class DHRoute {
  static final String initialRoute = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (context) => MainScreen(),
    HomaPage.routeName: (context) => HomaPage(),
    FavorPage.routeName: (context) => FavorPage(),
    MealPage.routeName: (context) => MealPage(),
    DetailPage.routeName: (context) => DetailPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };
  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
