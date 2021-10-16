import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/basket/cubits/get_cart_states.dart';
import 'package:marketing_buzz/views/basket/models/add_Cart_Model.dart';

class CartViewCubit extends Cubit<GetCartStates>{
  CartViewCubit():super(GetCartInitial());

  static CartViewCubit of(context)=>BlocProvider.of(context);

  AddCartModel addCartModel;

  Future<void> getCart() async{
    emit(GetCartLoading());
    try{
      final resp = await Dio().get(baseUrl+'carts' , options: dioOptions);
      addCartModel = AddCartModel.fromJson(resp.data);
    }catch(e,s){
      print(e);
      print(s);
    }
    emit(GetCartInitial());
  }
  
  Future<void> updateCart(int cartId , int quantity)async{
    try{
      final response = await Dio().put(baseUrl+'carts/$cartId' ,data: {
        'quantity':quantity},
        options: dioOptions,
      );
      addCartModel.data.total = response.data['data']['total'];
    }catch(e,s){
      print(e);
      print(s);
    }
    emit(GetCartInitial());
  }
  
  Future<void> removeFromCard(int cartId)async{
    addCartModel.data.cartItems.removeWhere((element) => element.id== cartId);
    emit(GetCartInitial());
    final response = await Dio().delete(baseUrl+'carts/$cartId' , options: dioOptions);
    addCartModel.data.total = response.data['data']['total'];
    emit(GetCartInitial());
    Fluttertoast.showToast(
        msg: 'Removed Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 20.0);
  }
  }
