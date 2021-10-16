import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_buzz/views/address_Card/model/model.dart';
import 'package:marketing_buzz/views/payment/cubits/states.dart';

class CheckOutController extends Cubit<CheckOutStates> {
  CheckOutController() : super(CheckOutInit());

  static CheckOutController of(context)=> BlocProvider.of(context);

  Address address;

  void selectAddress(Address value){
    address = value;
    emit(CheckOutInit());
  }

}