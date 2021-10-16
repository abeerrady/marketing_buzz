import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/core/route/route.dart';
import 'package:marketing_buzz/views/authentication/sign_Up/cubits/states.dart';
import 'package:marketing_buzz/views/view.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitState());

  static SignUpCubit of(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (!formKey.currentState.validate()) return;
    emit(SignUpLoadingState());
    final formData = {
      'name': userNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'phone': phoneNumberController.text
    };
    try {
      final response = await Dio().post(baseUrl + 'register', data: formData,
          options: Options(validateStatus: (status) {
        return status < 500;
      }));
      final data = response.data as Map;
      if (!data['status']) {
        ScaffoldMessenger.of(MagicRouter.currentContext)
            .showSnackBar(SnackBar(content: Text('Error!')));
      } else {
        MagicRouter.navigateAndPopAll(HomeScreens());
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(SignUpInitState());
  }
}
