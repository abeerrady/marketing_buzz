import 'package:flutter/material.dart';
import 'package:marketing_buzz/widgets/default_form_field.dart';

import '../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordTextField extends StatefulWidget {
final TextEditingController controller;

  const PasswordTextField({Key key, this.controller}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return defaultFormField(
      controller: widget.controller,
      type: TextInputType.visiblePassword,
      suffix: isPassword ? Icons.visibility_off : Icons.visibility,
      isPassword: isPassword,
      suffixPressed: () {
        setState(() {
          isPassword = !isPassword;
        });
      },
      validate: (String value) {
        if (value.isEmpty) {
          return LocaleKeys.Login_PleaseEnterYourPassword.tr();
        }
      },
      label: LocaleKeys.Login_Password.tr(),
      prefix: Icons.vpn_key_outlined,
    );
  }
}


