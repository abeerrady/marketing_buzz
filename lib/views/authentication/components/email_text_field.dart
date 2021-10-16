import 'package:flutter/material.dart';
import 'package:marketing_buzz/widgets/default_form_field.dart';

import '../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return defaultFormField(
      controller: controller,
      type: TextInputType.emailAddress,
      validate: (String value) {
        if (value.isEmpty) {
          return LocaleKeys.Login_PleaseEnterYourEmail.tr();
        }
      },
      label: LocaleKeys.Login_UsernameEmail.tr(),
      prefix: Icons.email_outlined,
    );
  }
}
