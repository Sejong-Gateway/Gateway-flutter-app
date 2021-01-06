import 'package:dio/dio.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/utils/token_storage.dart';

import '../service.dart';

class AuthApiService with ApiService implements AuthApi {
  TokenStorage _tokenStorage = diContainer<TokenStorage>();

  @override
  Future<void> login(String studentId, String password) async {
    var accessToken = await _tokenStorage.get();

    Response res = await dio.post(
      "/user/login",
      options: Options(
        headers: {"Authorization": "Bearer " + accessToken},
      ),
    );
  }
}
