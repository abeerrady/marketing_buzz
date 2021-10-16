


import 'package:flutter/cupertino.dart';
import 'package:marketing_buzz/views/on_Boarding/model/board_model.dart';

Widget buildBoardingItem(BoardingModel model , context) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: Image(
        image: AssetImage('${model.image}' ,),
      )
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 25.0,
        // fontFamily: 'Jannah'
        ),
      ),
    ),
    SizedBox(
      height: 50.0,
    ),
  ],
);
