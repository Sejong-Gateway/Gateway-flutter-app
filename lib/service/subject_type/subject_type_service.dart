import 'dart:convert';
import 'package:gateway/models/subject/subject_type.dart';
import 'package:gateway/service/subject_type/subject_type_api.dart';
import 'package:http/http.dart' as http;
import 'package:gateway/models/error.dart';
import 'package:gateway/service/service.dart';

final _SubjectTypeService SubjectTypeService = _SubjectTypeService();

class _SubjectTypeService extends ApiService with SubjectTypeApi {
  @override
  Future<List<SubjectType>> getSubjectTypeList(
      {String typeUUID, String departmentUUID}) async {
    http.Response res = await http.get(
      this._getSubjectTypeListLURL,
      headers: defaultHeader,
    );

    if (res.statusCode == 200) {
      return ((json.decode(res.body) ?? []) as List<dynamic>)
          .map<SubjectType>((subject) => SubjectType.fromJson(subject))
          .toList();
    }

    throw APIError.fromJSON(json.decode(res.body));
  }
}

extension on _SubjectTypeService {
  String get _getSubjectTypeListLURL =>
      this.baseURL + "/type/";
}
