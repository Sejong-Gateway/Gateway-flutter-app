import 'package:dio/dio.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/utils/token_storage.dart';

import '../service.dart';

class AuthApiService with ApiService implements AuthApi {
  // TokenStorage _tokenStorage = diContainer<TokenStorage>();

  @override
  Future<void> login(String studentId, String password) async {
    // var accessToken = await _tokenStorage.get();

    Response res = await dio.post(
      "/user/login",
    );
  }

  @override
  Future<void> register({
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
  }) async{
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
}
