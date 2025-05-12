import 'package:favorcate/ui/pages/filter/filter_content.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  static const String routeName = "/filter";

  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("过滤"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: FilterContent(),
    );
  }
}
