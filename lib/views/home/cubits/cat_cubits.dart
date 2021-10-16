
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/home/cubits/cat_states.dart';
import 'package:marketing_buzz/views/home/models/cat_model.dart';

class CategoryCubit extends Cubit<CategoryStates>{
  CategoryCubit(): super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  CategoryModel categoryModel;

  Future<void> getCategories ()async {
    emit(CategoryLoading());

    try{
      final response = await Dio().get(baseUrl +'categories' , options: dioOptions);
      categoryModel = CategoryModel.fromJson(response.data);
    }catch(e){
      print(e.toString());
    }
    emit(CategoryInitial());

}
}