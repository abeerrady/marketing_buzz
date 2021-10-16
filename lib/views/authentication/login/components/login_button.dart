import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/authentication/login/cubit/cubit.dart';
import 'package:marketing_buzz/views/authentication/login/cubit/states.dart';
import 'package:marketing_buzz/widgets/default_button.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

import '../../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller = LoginCubit.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context, state) => state is LoginLoadingState
          ? Center(
        child: LoadingIndicator(),
      )
          : defaultButton(
        text: LocaleKeys.Login_Login.tr(),
        function: () {
          controller.userLogin();
        },
        color: defaultColor,
        width: 200,
        isUpperCase: true,
        radius: 10,
      ),
    );
  }
}
