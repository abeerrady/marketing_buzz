import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../locale_keys.dart';
class SignUpHeader extends StatelessWidget {

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

        Text(LocaleKeys.SignUp_REGISTER.tr(), style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold),)
      ],
    );
  }
}
