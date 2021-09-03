import 'dart:convert';
import 'package:gateway/models/auth/signup_request.dart';
import 'package:gateway/models/auth/user.dart';
import 'package:http/http.dart' as http;
import 'package:gateway/models/auth/signin_response.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/service/auth/auth_api.dart';
import 'package:gateway/service/service.dart';

final _AuthService AuthService = _AuthService();
class _AuthService extends ApiService with AuthApi {
  @override
  Future<SignInResponse> signIn(int studentId, String password) async {
    http.Response res = await http.post(
      this._signinURL,
      headers: this.defaultHeader,
      body: json.encode(
        {
          "studentId": studentId,
          "password": password,
        },
      ),
    );

    if (res.statusCode == 200) {
      return SignInResponse.fromJson(
        json.decode(res.body),
      );
    }

    throw APIError.fromJSON(json.decode(res.body));
  }

  @override
  Future<void> signUp(SignUpRequest signUpRequest) async{
    http.Response res = await http.post(
      this._signupURL,
      headers: this.defaultHeader,
      body: json.encode(signUpRequest.jsonValue),
    );

    if (res.statusCode != 200) {
      throw APIError.fromJSON(json.decode(res.body));
    }
  }

  @override
  Future<User> getUserInfo(String accessToken) async{
    http.Response res = await http.get(
      this._userInfoURL,
      headers: this.authorizationHeader(accessToken),
    );

    print(res.body);

    if (res.statusCode == 200) {
      return User.fromJson(json.decode(res.body)["user"]);
    }
    throw APIError.fromJSON(json.decode(res.body));
  }

  @override
  Future<void> updateCurrentSubjects(String accessToken, List<String> subjectUUIDs)async {
    http.Response res = await http.put(
      this._userCurrentSubjectURL,
      headers: this.authorizationHeader(accessToken),
      body: json.encode({
        "completeSubjectUUIDs": subjectUUIDs,
      })
    );

    print(res.body);

    if (res.statusCode != 200) {
      throw APIError.fromJSON(json.decode(res.body));
    }
  }
}

extension on _AuthService{
  String get _signinURL => this.baseURL + "/auth/signin";
  String get _signupURL => this.baseURL + "/auth/signup";
  String get _userInfoURL => this.baseURL + "/auth/me";
  String get _userCurrentSubjectURL => this.baseURL + "/auth/complete-subjects";
}