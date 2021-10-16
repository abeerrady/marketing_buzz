import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/search/cubits/states.dart';
import 'package:marketing_buzz/views/search/model/model.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit(): super(SearchInit());

  static SearchCubit of(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();

  SearchModel searchModel;

  Future<void> getSearch()async{
    emit(SearchLoading());
   try{
     final resp = await Dio().post(baseUrl+'products/search', data: {"text" : searchController.text},
     options: Options(
       headers: {
         "Authorization" :"${SharedHelper.getToken}"
       }
     )
     );
     final data = resp.data as Map;
     if (data['status'] == true)
       {
         searchModel= SearchModel.fromJson(data);
         print(resp.data);
       }
     else{
       print('Error');
     }
   }catch(e,s){
     print(e.toString());
     print(s);

   }
   emit(SearchInit());
  }

}