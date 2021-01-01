import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/models/Course_model.dart';

class FirstPage extends StatelessWidget {

  List<CourseModel> courseList = [
    CourseModel.dummy(),
    CourseModel.dummy(),
    CourseModel.dummy()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [],
      ),
    );
  }
}
