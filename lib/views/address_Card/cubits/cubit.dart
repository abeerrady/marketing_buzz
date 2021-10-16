import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/address_Card/cubits/states.dart';
import 'package:marketing_buzz/views/address_Card/model/model.dart';

class AddressController extends Cubit<AddressStates> {
  AddressController(this.isSelectable) : super(AddressLoading());

  final bool isSelectable;
  static AddressController of(context) => BlocProvider.of(context);
  GetAddressModel getAddressModel;

  Future<void> getAddress() async {
    emit(AddressLoading());
    try {
      final response = await Dio().get(
        baseUrl + 'addresses',
        options: dioOptions,
      );
      getAddressModel = GetAddressModel.fromJson(response.data);
      print(response.data);
    } catch (e) {
      print(e);
    }
    emit(AddressInitial());
  }

  Future<void> removeFromCards(int cardId) async {
    getAddressModel.data.address.removeWhere((element) => element.id == cardId);
    emit(AddressInitial());
    final response = await Dio().delete(
      baseUrl + 'addresses/$cardId',
      options: dioOptions,
    );
    print(response.data);
    // getAddressModel = GetAddressModel.fromJson(response.data);
    emit(AddressInitial());
    Fluttertoast.showToast(
        msg: 'Deleted Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 20.0);
  }
}