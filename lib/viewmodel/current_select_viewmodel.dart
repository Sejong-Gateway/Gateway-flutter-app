import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/core/base_viewmodel.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/service/api/subject/subject_api.dart';
import 'package:login_page/service/flow/register_flow.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentSelectViewModel extends BaseViewModel {
  RegisterFlow _registerFlow = diContainer<RegisterFlow>();
  SubjectApi _subjectApiService = diContainer<SubjectApi>();
  List<SubjectModel> subjectList = [];
  List<String> selectList = [];

  void initState() async{
    try{
      print(_registerFlow.major);
      subjectList = await _subjectApiService.getSubject(_registerFlow.major);
      setState(ViewState.IDLE);
    } catch(e){
      print(e);
    }
  }

  void onSelectSubject(String id){
    if ( selectList.indexWhere((element) => element == id) != -1 ){
      selectList.remove(id);
    }
    else{
      selectList.add(id);
    }
    setState(ViewState.IDLE);
  }

  void onClickNext(){
    _registerFlow.setCompleteSubject(selectList);
    print(_registerFlow.completeSubjects);
  }

  void onClickFutureNext(){
    _registerFlow.setCurrentSubject(selectList);
  }

  List<String> get getCurrentSubjectList => _registerFlow.completeSubjects;

}
