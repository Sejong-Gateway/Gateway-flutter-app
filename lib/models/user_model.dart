import 'package:login_page/models/subject_model.dart';

class UserModel {
  final String major;
  final String semester;
  final List<SubjectModel> currentSubjects;
  final List<SubjectModel> completeSubjects;
  final List<SubjectModel> uncompletedSubjects;
  final bool abeek;
  final int westernBook;
  final int easternBook;
  final int literatureBook;
  final int scienceBook;
  final int volunteerTime;
  final int toeic;
  final int ibt;
  final int teps;
  final int opic;
  final int toeicSpeaking;

  UserModel({
    this.semester,
    this.major,
    this.currentSubjects,
    this.completeSubjects,
    this.uncompletedSubjects,
    this.abeek,
    this.westernBook,
    this.easternBook,
    this.literatureBook,
    this.scienceBook,
    this.volunteerTime,
    this.toeic,
    this.ibt,
    this.teps,
    this.opic,
    this.toeicSpeaking,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      major: json["major"] as String,
      semester: json["semester"] as String,
      abeek: json["abeek"] as bool,
      westernBook: json["westernBook"] as int,
      easternBook: json["easternBook"] as int,
      literatureBook: json["literatureBook"] as int,
      scienceBook: json["scienceBook"] as int,
      toeic: json["toeic"] as int,
      ibt: json["ibt"] as int,
      teps: json["teps"] as int,
      opic: json["opic"] as int,
      toeicSpeaking: json["toeicSpeaking"] as int,
      volunteerTime: json["volunteerTime"] as int,
      completeSubjects: ((json["completeSubjects"] ?? []) as List<dynamic>)
          .map<SubjectModel>((json) => SubjectModel.fromJson(json))
          .toList(),
      currentSubjects: ((json["currentSubjects"] ?? []) as List<dynamic>)
          .map<SubjectModel>((json) => SubjectModel.fromJson(json))
          .toList(),
      uncompletedSubjects: ((json["uncompletedSubjects"] ?? []) as List<dynamic>)
          .map<SubjectModel>((json) => SubjectModel.fromJson(json))
          .toList(),
    );
  }
}
