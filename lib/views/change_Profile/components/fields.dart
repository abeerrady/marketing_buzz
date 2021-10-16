import 'package:flutter/material.dart';
import 'package:marketing_buzz/views/change_Profile/cubits/cubit.dart';
import 'package:marketing_buzz/widgets/default_form_field.dart';

import '../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class Fields extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileChangeCubit.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30 , top: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              child: defaultFormField(
                type: TextInputType.text,
                label: LocaleKeys.SignUp_FullName.tr(),
                prefix: Icons.person_outline,
                controller: cubit.nameController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              child: defaultFormField(
                type: TextInputType.emailAddress,
                label: LocaleKeys.Login_UsernameEmail.tr(),
                prefix: Icons.email_outlined,
                controller: cubit.emailController
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              child: defaultFormField(
                type: TextInputType.phone,
                label: LocaleKeys.SignUp_PhoneNumber.tr(),
                prefix: Icons.phone_android_outlined,
                controller: cubit.phoneController
              ),
            ),
          ),
        ],
      ),
    );
  }
}
