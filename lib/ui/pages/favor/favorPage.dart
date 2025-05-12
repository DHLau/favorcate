import 'package:favorcate/ui/pages/favor/favor_content.dart';
import 'package:flutter/material.dart';

class FavorPage extends StatefulWidget {
  static const String routeName = '/favor';
  const FavorPage({super.key});

  @override
  State<FavorPage> createState() => _FavorPageState();
}

class _FavorPageState extends State<FavorPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FavorContentPage()));
  }
}
