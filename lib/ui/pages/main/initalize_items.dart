import 'package:favorcate/ui/pages/favor/favorPage.dart';
import 'package:favorcate/ui/pages/home/home.dart';
import 'package:flutter/material.dart';

final List<Widget> pages = [HomaPage(), FavorPage()];

final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '收藏'),
];
