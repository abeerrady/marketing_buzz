import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/basket/models/model.dart';

import 'cart_states.dart';

class CartController extends Cubit<CartStates> {
  CartController() : super(CartInitial());

  static CartController of(context) => BlocProvider.of(context);
  CartModel cartModel;

  Future<void> addCart(int productId) async {
    emit(CartLoading());
    try {
      final response = await Dio().post(
        baseUrl + 'carts',
        data: {'product_id': productId},
        options: dioOptions,
      );
      cartModel = CartModel.fromJson(response.data);
      print(response.data);
    } catch (e , s) {
      print(e);
      print(s);

    }
    emit(CartInitial());
    Fluttertoast.showToast(
        msg: 'item added',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 20.0);
  }
}