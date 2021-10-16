import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function press;

  const MainButton({Key key, @required this.text, @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30, bottom: 10),
      child: InkWell(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: defaultColor, borderRadius: BorderRadius.circular(3)),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}