import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';


class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String text;
  CustomExpansionTile({this.title , this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(5)
      ),
      child: ExpansionTile(
        iconColor: defaultColor,
        textColor: Colors.black,
        title: Text(title),
        children: [
          ListTile(title: Text(text)),
        ],
      ),
    );
  }
}
