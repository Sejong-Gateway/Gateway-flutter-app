import 'package:flutter/material.dart';
import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/service/flow/register_flow.dart';

class RegisterViewModel extends BaseViewModel {
  RegisterFlow _registerService = diContainer<RegisterFlow>();
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  String major;
  String semester;

  void onClickRegister() {
    _registerService.setUserInfo(
      studentId: idController.text,
      user_pw: pwController.text,
      major: major,
      semester: semester,
      abeek: true,
    );

  }

  void onSelectMajor(String major) {
    this.major = major;
    setState(ViewState.IDLE);
  }

  void onSelectSemester(String semester) {
    this.semester = semester;
    setState(ViewState.IDLE);
  }
}
