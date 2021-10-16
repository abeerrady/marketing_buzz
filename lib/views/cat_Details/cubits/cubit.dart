import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/cat_Details/cubits/states.dart';
import 'package:marketing_buzz/views/cat_Details/model/model.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsStates> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());

  static CategoryDetailsCubit of(context) => BlocProvider.of(context);
  CategoryDetailsModel categoryDetailsModel;

  Future<void> getProduct(int categoryId) async {
    emit(CategoryDetailsLoading());
    try {
      final response = await Dio().get(
        baseUrl + 'products' + '?category_id=$categoryId',
          options: Options(
              headers: {
                "Authorization" :"${SharedHelper.getToken}"
              }
          )
      );
      categoryDetailsModel = CategoryDetailsModel.fromJson(response.data);
      print(response.data);
    } catch (e , s) {
      print(e);
      print(s);
    }
    emit(CategoryDetailsInitial());
  }
}