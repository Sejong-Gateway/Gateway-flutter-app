import 'dart:convert';
import 'package:gateway/models/department/collage.dart';
import 'package:gateway/models/subject/subject.dart';
import 'package:gateway/service/collage/collage_api.dart';
import 'package:gateway/service/subject/subject_api.dart';
import 'package:http/http.dart' as http;
import 'package:gateway/models/auth/signin_response.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/service/service.dart';

final _SubjectService SubjectService = _SubjectService();

class _SubjectService extends ApiService with SubjectApi {
  @override
  Future<List<Subject>> getSubjectList(
      {String typeUUID, String departmentUUID}) async {
    http.Response res = await http.get(
      this._getSubjectListLURL(typeUUID, departmentUUID),
      headers: defaultHeader,
    );

    if (res.statusCode == 200) {
      return ((json.decode(res.body) ?? []) as List<dynamic>)
          .map<Subject>((subject) => Subject.fromJson(subject))
          .toList();
    }

    throw APIError.fromJSON(json.decode(res.body));
  }
}

extension on _SubjectService {
  String _getSubjectListLURL(String typeUUID, String departmentUUID) =>
      this.baseURL +
      "/subject?typeUUID=$typeUUID&departmentUUID=$departmentUUID";
}
