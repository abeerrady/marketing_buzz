import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/add_address/cubit/states.dart';

class AddAddressController extends Cubit<AddAddressStates> {
  AddAddressController() : super(AddAddressInitial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  static AddAddressController of(context) => BlocProvider.of(context);

  Future<String> addAddress() async {
    emit(AddAddressLoading());
    try {
      final response = await Dio().post(
        baseUrl + 'addresses',
        options: dioOptions,
        data: {
          'name': nameController.text,
          'city': cityController.text,
          'region': regionController.text,
          'notes': notesController.text,
          'details': detailsController.text,
          'latitude': 0,
          'longitude': 0,
        },
      );
      final data = response.data as Map;
      print(data);
      if (data['status']) {
        print('yes' * 90);
        return 'ok';
      } else {
        emit(AddAddressInitial());
        return 'Enter Correct Address';
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  Future<void> update(int cardId) async {
    emit(AddAddressLoading());

    final formData = {
      "name": nameController.text,
      "city": cityController.text,
      "region": regionController.text,
      "details": detailsController.text,
      "notes": notesController.text,
    };

    try {
      final response = await Dio().put(baseUrl + 'addresses/$cardId',
          data: formData, options: dioOptions);
      print(response.data);
    } catch (e) {
      print(e);
    }
    emit(AddAddressInitial());
  }
}