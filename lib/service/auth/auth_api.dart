import 'package:gateway/models/auth/signin_response.dart';
import 'package:gateway/models/auth/signup_request.dart';
import 'package:gateway/models/auth/user.dart';

abstract class AuthApi {
  Future<SignInResponse> signIn(int studentId, String password);

  Future<void> signUp(SignUpRequest signUpRequest);

  Future<User> getUserInfo(String accessToken);

  Future<void> updateCurrentSubjects(String accessToken, List<String> subjectUUIDs);
}
