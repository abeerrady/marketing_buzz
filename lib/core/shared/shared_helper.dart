import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences _preferences;

  static void init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setData(String token , int id , String email , String name, String phone, String image){
    _preferences.setString('token', token);
    _preferences.setInt('id', id);
    _preferences.setString('email',email);
    _preferences.setString('name',name);
    _preferences.setString('phone',phone);
    _preferences.setString('image',image);
    print('Data Stored Successfully');
  }
  static Future<void> setToken(String value)async=> await _preferences.setString('token', value);

  static bool containsId(){
    return _preferences.containsKey('id');
  }
  static bool containsToken(){
    return _preferences.containsKey('token');
  }

  static void setLanguage(String code){
    _preferences.setString('lang', code);
  }

  static String get getLanguageCode{
    return _preferences.getString('lang');
  }

  static void removeData(){
    _preferences.remove('id');
    _preferences.remove('token');
    _preferences.remove('email');
    _preferences.remove('phone');
    _preferences.remove('name');
    _preferences.remove('image');
  }
  static bool get isLogged =>_preferences.containsKey('token');

  static String get getToken {
    return _preferences.getString('token');
  }

  static int get getId {
    return _preferences.getInt('id');
  }

  static String get getEmail {
    return _preferences.getString('email');
  }

  static String get getName {
    return _preferences.getString('name');
  }

  static String get getPhone {
    return _preferences.getString('phone');
  }

  static String get getImage {
    return _preferences.getString('image');
  }


}