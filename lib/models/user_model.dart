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
}
