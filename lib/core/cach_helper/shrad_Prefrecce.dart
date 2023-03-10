
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper{
  static SharedPreferences? sharedPreferences;
  static  init()async{
    sharedPreferences=await SharedPreferences.getInstance();

}
static Future<bool?> saveData({required String key,required dynamic value})async{
    if(value is String){
      return await sharedPreferences?.setString(key, value);
    }
    if(value is int){
      return await sharedPreferences?.setInt(key, value);
    }
    if(value is bool){
      return await sharedPreferences?.setBool(key, value);
    }
    return await sharedPreferences?.setDouble(key, value);
}


static getDate({required String key})async
{
    return sharedPreferences?.get(key);
}
  static Future<bool> removeDate({required String key})async
  {
    return await sharedPreferences!.remove(key);
  }

}