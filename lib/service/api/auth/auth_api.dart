import 'package:login_page/models/user_model.dart';

abstract class AuthApi {
  Future<String> login(String studentId, String password);

  Future<void> register(
    String studentId,
    String user_pw,
    String semester,
    String major,
    bool abeek,
    int westernBook,
    int easternBook,
    int literatureBook,
    int scienceBook,
    int volunteerTime,
    int toeic,
    int ibt,
    int teps,
    int opic,
    int toeicSpeaking,
    List<String> currentSubjects,
    List<String> completeSubjects,
  );

  Future<UserModel> getUserInfo(String accessToken);
}
