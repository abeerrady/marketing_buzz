import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/favorite/models/model.dart';
import 'package:marketing_buzz/views/home/cubits/states.dart';
import 'package:marketing_buzz/views/home/models/model.dart';


class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitState());

  static HomeCubit of(context) => BlocProvider.of(context);

  ResponseData responseData;
  FavoriteModel favoriteModel;
  Map<int,bool> favorites ={};
  Future<void> getData ()async{
    emit(HomeLoadingState());
    
    try{
      final response = await Dio().get(baseUrl+'home',options: Options(
        headers: {
          if(SharedHelper.containsToken())
           'Authorization' : SharedHelper.getToken
        }
      ) );
      print(response.data);
     responseData = ResponseData.fromJson(response.data);
     responseData.data.products.forEach((element) {
       favorites.addAll({element.id:element.inFavorites});
     });
    }catch(e){
      print(e.toString());
    }
      emit(HomeInitState());
  }
}