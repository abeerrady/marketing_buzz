import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/favorite/models/get_Model.dart';

import 'get_states.dart';

class GetFavoriteController extends Cubit<AddFavoriteStates> {
  GetFavoriteController() : super(AddFavoriteInitial());


  static GetFavoriteController of(context) => BlocProvider.of(context);
  AddFavModel addFavModel;
  Future<void> getFavorite() async {
    emit(AddFavoriteLoading());
    try {
      final response = await Dio().get(
        baseUrl + 'favorites',
          options: Options(
              headers: {
                "Authorization" :"${SharedHelper.getToken}"
              }
          )
      );
      addFavModel = AddFavModel.fromJson(response.data);
      print(response.data);
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    } catch (e) {
      print(e);
    }
    emit(AddFavoriteInitial());
  }

  Future<void> removeFromFavourite(int index) async {
    addFavModel
        .data
        .data
        .removeAt(index);
    emit(AddFavoriteInitial());
    Fluttertoast.showToast(
        msg: 'item removed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 18.0);
  }
}