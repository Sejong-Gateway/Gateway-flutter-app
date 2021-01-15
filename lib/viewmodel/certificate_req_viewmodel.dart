import 'package:flutter/cupertino.dart';
import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/service/api/common/token.dart';
import 'package:login_page/service/flow/register_flow.dart';

class CertificateReqViewModel extends BaseViewModel {
  RegisterFlow _registerFlow = diContainer<RegisterFlow>();
  AuthApi _authApiService = diContainer<AuthApi>();
  TokenService _tokenService = diContainer<TokenService>();

  TextEditingController westernBook = TextEditingController();
  TextEditingController easternBook = TextEditingController();
  TextEditingController literatureBook = TextEditingController();
  TextEditingController scienceBook = TextEditingController();
  TextEditingController volunteerTime = TextEditingController();
  TextEditingController toeic = TextEditingController();
  TextEditingController ibt = TextEditingController();
  TextEditingController teps = TextEditingController();
  TextEditingController opic = TextEditingController();
  TextEditingController toeicSpeaking = TextEditingController();

  void onClickNext() async{
    try{
      _registerFlow.setScore(
        westernBook: westernBook.text.isNotEmpty ? westernBook.text : "0",
        easternBook: easternBook.text.isNotEmpty ? easternBook.text: "0",
        literatureBook: literatureBook.text.isNotEmpty ? literatureBook.text: "0",
        scienceBook: scienceBook.text.isNotEmpty ? scienceBook.text: "0",
        volunteerTime: westernBook.text.isNotEmpty ? volunteerTime.text: "0",
        toeic: westernBook.text.isNotEmpty ? toeic.text: "0",
        ibt: westernBook.text.isNotEmpty ? ibt.text: "0",
        teps: westernBook.text.isNotEmpty ? teps.text: "0",
        opic: westernBook.text.isNotEmpty ? opic.text: "0",
        toeicSpeaking: westernBook.text.isNotEmpty ? toeicSpeaking.text: "0",
      );
      await _registerFlow.registerUser();
      String accessToken = await _authApiService.login(_registerFlow.studentId, _registerFlow.user_pw);
      _tokenService.setAccessToken(accessToken);
    }catch(e){
      print(e);
    }
  }
}
