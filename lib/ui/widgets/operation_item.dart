import 'package:flutter/material.dart';

class OperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;

  const OperationItem(this._icon, this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [_icon, SizedBox(width: 3), Text(_title)]);
  }
}
