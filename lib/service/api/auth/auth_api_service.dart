import 'package:dio/dio.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/models/user_model.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/service/api/common/token.dart';
import '../service.dart';

class AuthApiService with ApiService implements AuthApi {
  @override
  Future<String> login(String studentId, String password) async {
    Response res = await dio.post(
      "/user/login",
      data: {
        "studentId" : studentId,
        "user_pw" : password,
      }
    );

    if ( res.statusCode == 200 ){
      return res.data["data"]["token"];
    }
  }

  @override
  Future<void> register(
    String studentId,
    String user_pw,
    String semester,
    String major,
    bool abeek,
    int westernBook,
    int easternBook,
    int literatureBook,
    int scienceBook,
    int volunteerTime,
    int toeic,
    int ibt,
    int teps,
    int opic,
    int toeicSpeaking,
    List<String> currentSubjects,
    List<String> completeSubjects,
  ) async{
    Response res = await dio.post(
      "/user/register",
      data: {
        "studentId" : studentId,
        "user_pw" : user_pw,
        "semester" : semester,
        "major" : major,
        "abeek" : abeek,
        "westernBook" : westernBook,
        "easternBook" : easternBook,
        "literatureBook" : literatureBook,
        "scienceBook" : scienceBook,
        "volunteerTime" : volunteerTime,
        "toeic" : toeic,
        "ibt" : ibt,
        "teps" : teps,
        "opic" : opic,
        "toeicSpeaking" : toeicSpeaking,
        "currentSubjects" : currentSubjects,
        "completeSubjects" : completeSubjects,
      }
    );
  }

  @override
  Future<UserModel> getUserInfo(String accessToken) async{
    Options options = Options(headers: {"x-access-token": accessToken});
    Response res = await dio.get(
        "/user/check",
        options: options,
    );

    if ( res.statusCode == 200 ){
      return UserModel.fromJson(res.data["data"]);
    }
  }


}
