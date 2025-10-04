
import '../../networking/local/prefs_key.dart';
import '../../networking/local/shared_prefs_helper.dart';

class AppFunctions{
  static void saveUserToken({required String token})async{
    await SharedPrefsHelper.setData(key: PrefsKey.tokenKey, value: token);
  }
}
