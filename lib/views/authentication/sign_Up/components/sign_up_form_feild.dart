import 'package:flutter/material.dart';
import 'package:marketing_buzz/views/authentication/components/email_text_field.dart';
import 'package:marketing_buzz/views/authentication/components/password_text_field.dart';
import 'package:marketing_buzz/views/authentication/login/view.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/components/phone_form_field.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/components/signup_button.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/components/user_name_form_field.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/cubits/cubit.dart';
import 'package:marketing_buzz/widgets/default_navigate.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../locale_keys.dart';

class SignUpFormsField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = SignUpCubit.of(context);
    return Form(
      key: controller.formKey,
      child: ListView(
        physics: ScrollPhysics(),
        children: [
          UserNameFormField(controller: controller.userNameController,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: EmailTextField(
              controller: controller.emailController,
            ),
          ),
          PhoneFormField(controller:controller.phoneNumberController),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: PasswordTextField(
              controller: controller.passwordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SignUpButton(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.SignUp_AlreadyAMember.tr(),
              ),
              TextButton(
                  onPressed: () {
                    NavigateAndFinish(context, LoginView());
                  },
                  child: Text( LocaleKeys.SignUp_Login.tr())),
            ],
          ),
        ],
      ),
    );
  }
}
