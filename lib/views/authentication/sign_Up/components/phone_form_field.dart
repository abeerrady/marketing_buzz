import 'package:flutter/material.dart';
import 'package:marketing_buzz/widgets/default_form_field.dart';

import '../../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class PhoneFormField extends StatelessWidget {
final TextEditingController controller;

  const PhoneFormField({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  defaultFormField(
      controller: controller,
      type: TextInputType.phone,
      validate: (String value) {
        if (value.isEmpty) {
          return  LocaleKeys.SignUp_PleaseEnterYourPhone.tr();
        }
      },
      label:  LocaleKeys.SignUp_PhoneNumber.tr(),
      prefix: Icons.phone_android_outlined,
    );
  }
}
