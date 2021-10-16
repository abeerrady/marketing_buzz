import 'package:flutter/material.dart';

class CustomListDetails extends StatelessWidget {
final String text;
final color;
  const CustomListDetails({Key key, this.text , this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: color,
            )),
      ],
    );
  }
}
