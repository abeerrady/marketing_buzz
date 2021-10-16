import 'package:flutter/material.dart';
import 'package:marketing_buzz/views/authentication/components/password_text_field.dart';
import 'package:marketing_buzz/views/authentication/login/cubit/cubit.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/view.dart';
import 'package:marketing_buzz/widgets/default_navigate.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../locale_keys.dart';
import '../../components/email_text_field.dart';
import 'forget_password_text.dart';
import 'login_button.dart';

class LoginFormsField extends StatefulWidget {
  @override
  _LoginFormsFieldState createState() => _LoginFormsFieldState();
}

class _LoginFormsFieldState extends State<LoginFormsField> {
  @override
  Widget build(BuildContext context) {
    final controller = LoginCubit.of(context);
    return Form(
      key: controller.formKey,
      child: ListView(
        physics: ScrollPhysics(),
        children: [
          EmailTextField(
            controller: controller.emailController,
          ),
          SizedBox(height: 20,),
          PasswordTextField(controller: controller.passwordController),
          ForgetPasswordText(),
          SizedBox(
            height: 40,
          ),
          LoginButton(),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.Login_DontYouHaveAnAccount.tr(),
              ),
              TextButton(
                  onPressed: () {
                    NavigateAndFinish(context, SignUpView());
                  },
                  child: Text(LocaleKeys.Login_Register.tr()))
            ],
          ),
        ],
      ),
    );
  }
}
