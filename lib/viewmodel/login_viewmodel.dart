import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:login_page/pages/signup_page.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/service/api/common/token.dart';
import 'package:login_page/service/flow/register_flow.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseViewModel {
  AuthApi _authApiService = diContainer<AuthApi>();
  TokenService _tokenService = diContainer<TokenService>();

  TextEditingController studentId = TextEditingController();
  TextEditingController userPw = TextEditingController();

  void onClickRegister(BuildContext context){
    if (diContainer.isRegistered<RegisterFlow>()){
      diContainer.unregister<RegisterFlow>();
      diContainer.registerLazySingleton(() => RegisterFlow());
    }
    else{
      diContainer.registerLazySingleton(() => RegisterFlow());
    }
    Navigator.of(context).push(SignupPage.route());
  }

  void onClickLogin(BuildContext context) async{
    try{
      String accessToken = await _authApiService.login(studentId.text, userPw.text);
      _tokenService.setAccessToken(accessToken);
      Navigator.of(context).push(MainPage.route());
    }catch(e){
      print(e);
    }
  }
}
