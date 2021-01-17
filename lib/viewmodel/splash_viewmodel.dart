import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:login_page/service/api/common/token.dart';

class SplashViewModel extends BaseViewModel {
  TokenService _tokenService = diContainer<TokenService>();

  void initState(BuildContext context) async {
    String accessToken = await _tokenService.getAccessToken();
    if ( accessToken != null ){
      Future.delayed(Duration(milliseconds: 1000)).then(
            (_) => Navigator.of(context).pushAndRemoveUntil(
          MainPage.route(), (route) => false,
        ),
      );
    }
    else{
      Future.delayed(Duration(milliseconds: 1000)).then(
            (_) => Navigator.of(context).pushAndRemoveUntil(
          LoginPage.route(), (route) => false,
        ),
      );
    }
  }
}
