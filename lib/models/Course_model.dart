import 'package:flutter/material.dart';

class CourseModel{
  final String name;
  final String grade;
  final String type;
  final String department;
  CourseModel({this.name,this.department, this.grade, this.type});

  factory CourseModel.dummy(){
    return CourseModel(
        name: "SW 설계기초",
        department: "소프트웨어공학",
        grade: "2-2",
        type: "전필"
    );
  }
}