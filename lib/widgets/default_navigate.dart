import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void NavigateTo(context , widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget));


void NavigateAndFinish(context , widget) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));

