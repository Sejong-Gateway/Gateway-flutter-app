import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/pages/login_page.dart';

class SplashViewModel extends BaseViewModel {
  void initState(BuildContext context) async {
    Future.delayed(Duration(milliseconds: 1000)).then(
      (_) => Navigator.of(context).pushAndRemoveUntil(
        LoginPage.route(), (route) => false,
      ),
    );
  }
}
