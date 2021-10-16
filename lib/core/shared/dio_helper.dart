import 'package:dio/dio.dart';

class DioHelper {
  static final _baseUrl = 'https://student.valuxapps.com/api/';

  static String get loggedKey => true.toString();

  static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;

  static Future<Response<dynamic>> post(String path,
      {FormData formData,
      Map<String, dynamic> body,
      Function(int, int) onSendProgress}) {
    // dio.options.headers = {
    //   'Authorization': 'Bearer ${loggedUser.apiToken}'
    // };
    final response = dioSingleton.post(path,
        data: formData != null ? formData : FormData.fromMap(body),
        onSendProgress: onSendProgress);
    // dio.options.headers = null;
    return response;
  }
}
