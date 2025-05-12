import 'package:favorcate/ui/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';
import 'initalize_items.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      drawer: HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        // 去掉点击的字体缩放
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
