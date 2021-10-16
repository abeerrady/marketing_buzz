import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/about_Us/cubits/states.dart';
import 'package:marketing_buzz/views/about_Us/model/model.dart';

class FaqsCubit extends Cubit<FaqsStates>{
  FaqsCubit(): super(FaqsInitial());
  
  static FaqsCubit of(context) => BlocProvider.of(context);
  
  FaqsModel faqsModel ;
  
  Future<void> getFaqs()async{
    emit(FaqsLoading());

    try{
      final response = await Dio().get(baseUrl+'faqs');
       faqsModel = FaqsModel.fromJson(response.data);
    }catch(e){
      print(e.toString());
    }
    emit(FaqsInitial());
    }
  }
