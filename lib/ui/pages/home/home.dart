import 'package:favorcate/ui/pages/home/home_app_bar.dart';
import 'package:favorcate/ui/pages/home/home_content.dart';
import 'package:favorcate/ui/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';

class HomaPage extends StatelessWidget {
  static const String routeName = '/home';

  const HomaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context),
      body: HomeContent(),
      // drawer: HomeDrawer(),
    );
  }
}
