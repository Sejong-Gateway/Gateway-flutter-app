import 'package:shared_preferences/shared_preferences.dart';

abstract class Token{
  Future<String> getAccessToken();
  void setAccessToken(String token);
}

class TokenService extends Token{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String> getAccessToken() async{
    final SharedPreferences prefs = await _prefs;

    return Future(() {
      return prefs.getString("token");
    });
  }

  @override
  void setAccessToken(String token) async{
    final SharedPreferences prefs = await _prefs;

    prefs.setString("token", token);
  }

}
