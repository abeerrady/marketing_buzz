
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_buzz/style/constants.dart';

Widget MyAppBar(
{
  @required String text,
}
    ){
  return AppBar(
    backgroundColor: defaultColor,
    centerTitle: true,
    title: Text(text , style: TextStyle(fontSize: 24),),
  );
}
