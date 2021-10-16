import 'package:dio/dio.dart';
import 'package:marketing_buzz/core/shared/shared_helper.dart';

const baseUrl='https://student.valuxapps.com/api/';

Map<String,dynamic> headers ={
  if(SharedHelper.isLogged) 'Authorization':SharedHelper.getToken,'lang':SharedHelper.getLanguageCode,
};
final dioOptions = Options(headers: headers);