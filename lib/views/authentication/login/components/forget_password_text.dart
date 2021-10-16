import 'package:flutter/material.dart';
import 'package:marketing_buzz/widgets/default_navigate.dart';

import '../../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
class ForgetPasswordText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            // NavigateTo(context, ResetPasswordView());
          },
          child: Text(LocaleKeys.Login_ForgetPassword.tr(),
              style: TextStyle(color: Colors.black, fontSize: 20)),
        )
      ],
    );
  }
}
