import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseViewModel {
  AuthApi _authApiService = diContainer<AuthApi>();

  void handleLogin(BuildContext context, String studentId, String password) async{
    try{
      await _authApiService.login(studentId, password);
      Navigator.of(context).push(MainPage.route());
    } catch(e){
      /** API 호출 실패 시*/
      print(e);
    }
  }
}
