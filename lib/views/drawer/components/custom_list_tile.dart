import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomListTile({Key key, this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
    );
  }
}
