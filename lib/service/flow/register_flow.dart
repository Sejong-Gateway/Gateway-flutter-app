import 'package:login_page/service/api/auth/auth_api_service.dart';
import 'package:login_page/service/api/service.dart';

class RegisterFlow extends ApiService with AuthApiService {
  String studentId;
  String user_pw;
  String semester;
  String major;
  bool abeek;
  int westernBook;
  int easternBook;
  int literatureBook;
  int scienceBook;
  int volunteerTime;
  int toeic;
  int ibt;
  int teps;
  int opic;
  int toeicSpeaking;

  List<String> completeSubjects = [];
  List<String> currentSubjects = [];


  RegisterFlow();

  void setUserInfo({studentId, user_pw, semester, major, abeek}) {
    this.studentId = studentId;
    this.user_pw = user_pw;
    this.semester = semester;
    this.major = major;
    this.abeek = abeek;
  }

  void setCurrentSubject(List<String> list) {
    completeSubjects = [
      ...completeSubjects,
      ...list,
    ];
  }

  void setFutureSubject(List<String> list) {
    currentSubjects = [
      ...currentSubjects,
      ...list,
    ];
  }

  void setScore({
    westernBook,
    easternBook,
    literatureBook,
    scienceBook,
    volunteerTime,
    toeic,
    ibt,
    teps,
    opic,
    toeicSpeaking,
  }) {
    this.westernBook = westernBook;
    this.easternBook = easternBook;
    this.literatureBook = literatureBook;
    this.volunteerTime = volunteerTime;
    this.toeic = toeic;
    this.ibt = ibt;
    this.teps = teps;
    this.opic = opic;
    this.toeicSpeaking = toeicSpeaking;
  }


}
