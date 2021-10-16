import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/favorite/cubits/states.dart';
import 'package:marketing_buzz/views/favorite/models/model.dart';

class FavoriteController extends Cubit<FavoriteStates> {
  FavoriteController() : super(FavoriteInitial());

  static FavoriteController of(context) => BlocProvider.of(context);
  FavoriteModel favoriteModel;
  Future<void> changeFavorite(int productId) async {
    try {
      final response = await Dio().post(baseUrl + 'favorites',
        data: {'product_id': productId},
          options: dioOptions
      );

    } catch (e,s) {
      print(e);
      print(s);

    }
  }
}