import 'package:shared_preferences/shared_preferences.dart';

const ACCESS_TOKEN = "accessToken";

class TokenException implements Exception {
  String msg;
  TokenException({this.msg});
}

class TokenStorage {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<void> set(String accessToken) async {
    var pref = await _pref;
    pref.setString(ACCESS_TOKEN, accessToken);
  }

  Future<String> get() async {
    var pref = await _pref;

    var accessToken = pref.getString(ACCESS_TOKEN);

    return accessToken;
  }

  Future<bool> clear() async {
    var pref = await _pref;
    return await pref.clear();
  }
}
