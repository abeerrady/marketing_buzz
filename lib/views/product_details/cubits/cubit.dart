import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/product_details/cubits/states.dart';
import 'package:marketing_buzz/views/product_details/model/model.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates>{
  ProductDetailsCubit(): super(ProductDetailsInitial());

  static ProductDetailsCubit of(context)=>BlocProvider.of(context);

  ProductDetailsModel productDetailsModel;
  
  Future<void> getDetails(int id)async{
    emit(ProductDetailsLoading());
    try{
      final response = await Dio().get(baseUrl+'products/$id' );
      productDetailsModel = ProductDetailsModel.fromJson(response.data);
      print(productDetailsModel.data.name);
    }catch(e,s){
      print(e);
      print(s);
    }
    emit(ProductDetailsInitial());
  }
}