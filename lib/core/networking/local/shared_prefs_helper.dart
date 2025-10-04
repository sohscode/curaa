import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper{

  static SharedPreferences? _prefs;
  static init ()async{
    _prefs= await SharedPreferences.getInstance();
  }

  static Future<void> setData({required String key,  value})async{
    if (value is String){
      _prefs!.setString(key, value);
    }else if (value is int){
      _prefs!.setInt(key, value);
    }else if (value is bool){
      _prefs!.setBool(key, value);
    }else if (value is double){
      _prefs!.setDouble(key, value);
    }
  }

  static getData({ required  key}){
    return _prefs!.get(key);
  }

  static removeData({key}){
    _prefs!.remove(key);
  }

}