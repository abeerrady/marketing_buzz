import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/views/add_address/cubit/states.dart';
import 'package:marketing_buzz/views/address_Card/model/model.dart';

class EditAddressController extends Cubit<AddAddressStates> {
  EditAddressController(this.address) : super(AddAddressInitial()){
    nameController = TextEditingController(text: address.name);
    cityController = TextEditingController(text: address.city);
    regionController = TextEditingController(text: address.region);
    detailsController = TextEditingController(text: address.details);
    notesController = TextEditingController(text: address.notes);
  }

  final Address address;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController;
  TextEditingController cityController;
  TextEditingController regionController;
  TextEditingController detailsController;
  TextEditingController notesController;

  static EditAddressController of(context) => BlocProvider.of(context);

  Future<void> update(int cardId) async {
    emit(AddAddressLoading());

    final formData = {
      "name": nameController.text,
      "city": cityController.text,
      "region": regionController.text,
      "details": detailsController.text,
      "notes": notesController.text,
      'latitude': 0,
      'longitude': 0,
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