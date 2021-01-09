import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends BaseViewModel {
  void initState(BuildContext context) async{
    Future.delayed(Duration(milliseconds: 500))
        .then((_) => Navigator.of(context).push(LoginPage.route()),
    );
  }
}
