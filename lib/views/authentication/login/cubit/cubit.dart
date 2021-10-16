import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/core/route/route.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/authentication/login/cubit/states.dart';
import 'package:marketing_buzz/views/view.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit of(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> userLogin() async {
    if (!formKey.currentState.validate()) return;
    emit(LoginLoadingState());
    final formData = {
      'email': emailController.text,
      'password': passwordController.text
    };
    try {
      final response = await Dio().post(baseUrl + 'login', data: formData,
          options: Options(validateStatus: (status) {
        return status < 500;
      }));
      print(response.data);
      final data = response.data as Map;
      if (data.containsValue(true)) {
        SharedHelper.setData(
            data['data']['token'],
            data['data']['id'],
            data['data']['email'],
            data['data']['name'],
            data['data']['phone'],
            data['data']['image']);
        print(SharedHelper.getToken);
        MagicRouter.navigateAndPopAll(HomeScreens());

      } else {
        ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(SnackBar(
            content: Text(
                'لم نتمكن من تسجيل الدخول برجاء التأكد من البيانات المدخلة')));
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(LoginInitState());
  }
}
