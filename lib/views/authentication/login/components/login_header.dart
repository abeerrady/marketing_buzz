import 'package:flutter/material.dart';

import '../../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';


class LoginHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_circle_down,
          size: 100,
          color: Colors.white,
        ),

        Text(LocaleKeys.Login_WELCOME.tr() , style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold),)
      ],
    );
  }
}
