import 'package:flutter/material.dart';

class OperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;

  const OperationItem(this._icon, this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_icon, SizedBox(width: 3), Text(_title)],
      ),
    );
  }
}
