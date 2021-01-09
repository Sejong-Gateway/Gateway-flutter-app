import 'package:dio/dio.dart';
import 'package:login_page/core/di_container.dart';
import 'package:login_page/models/subject_model.dart';
import 'package:login_page/service/api/auth/auth_api.dart';
import 'package:login_page/service/api/subject/subject_api.dart';

import '../service.dart';

class SubjectApiService with ApiService implements SubjectApi {
  @override
  Future<List<SubjectModel>> getSubject(String major) async{
    Response res = await dio.get(
      "/subject",
      queryParameters: {"major" : major}
    );

    if ( res.statusCode == 200 ){
      return (res.data["data"] as List)?.map((e) => SubjectModel.fromJson(e))?.toList() ??
          [];
    }
  }
  // TokenStorage _tokenStorage = diContainer<TokenStorage>();
}
