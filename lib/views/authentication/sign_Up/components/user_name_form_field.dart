import 'package:flutter/material.dart';
import 'package:marketing_buzz/widgets/default_form_field.dart';

import '../../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class UserNameFormField extends StatelessWidget {
  final TextEditingController controller;

  const UserNameFormField({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  defaultFormField(
      controller: controller,
      type: TextInputType.text,
      validate: (String value) {
        if (value.isEmpty) {
          return LocaleKeys.SignUp_PleaseEnterYourName.tr();
        }
      },
      label: LocaleKeys.SignUp_FullName.tr(),
      prefix: Icons.person_outline,
    );
  }
}
