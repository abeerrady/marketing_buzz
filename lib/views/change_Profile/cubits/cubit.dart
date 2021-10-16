

import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketing_buzz/constants/strings.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';
import 'package:marketing_buzz/views/change_Profile/cubits/states.dart';

class ProfileChangeCubit extends Cubit<ProfileChangeStates>{
  ProfileChangeCubit(): super(ProfileChangeInit());

  static ProfileChangeCubit of(context) => BlocProvider.of(context);

  File file;
  TextEditingController nameController =
  TextEditingController(text: SharedHelper.getName);
  TextEditingController phoneController =
  TextEditingController(text: SharedHelper.getPhone);

  TextEditingController emailController =
  TextEditingController(text: SharedHelper.getEmail);

Future<void> changeProfile()async{
  emit(ProfileChangeLoading());
  /// Raw on postman
  final body ={
    "name": nameController.text,
    "phone":phoneController.text,
    "email": emailController.text,
    // if(file !=null) "image" :base64Encode(file.readAsBytesSync())

  };
  /// FormData on postman
  // final formData = FormData.fromMap(body);
  // formData.files.add(MapEntry('image', await MultipartFile.fromFile(file.path)));
  try{
    final response = await Dio().put(baseUrl+'update-profile' ,options: Options(headers: {'Authorization' : SharedHelper.getToken}), data: body);

    await SharedHelper.setData(response.data['data']['token'], SharedHelper.getId, emailController.text, nameController.text, phoneController.text, response.data['data']['image']);
  }catch(e){
    print(e.toString());
  }
  emit(ProfileChangeInit());
}

void pickPhoto() async {
  final pickedFile= await ImagePicker().pickImage(source: ImageSource.gallery);
  if(pickedFile == null) return;
  file = File(pickedFile.path);
  emit(ProfileChangeInit());
}

@override
Future<void> close(){
  nameController.dispose();
  return super.close();
}
}