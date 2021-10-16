import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/style/constants.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/cubits/cubit.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/cubits/states.dart';
import 'package:marketing_buzz/widgets/default_button.dart';
import 'package:marketing_buzz/widgets/loading_indicator.dart';

import '../../../../locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller = SignUpCubit.of(context);
    return BlocBuilder(
      bloc: controller,
      builder: (context , state) => state is SignUpLoadingState ? LoadingIndicator() : defaultButton(
        text:  LocaleKeys.SignUp_SignUp.tr(),
        function: (){
          controller.signUp();
        },
        color: defaultColor,
        width: 200,
        isUpperCase: true,
        radius: 10,
      ),
    );
  }
}
