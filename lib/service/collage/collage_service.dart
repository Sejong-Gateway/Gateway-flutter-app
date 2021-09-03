import 'dart:convert';
import 'package:gateway/models/department/collage.dart';
import 'package:gateway/models/department/department.dart';
import 'package:gateway/service/collage/collage_api.dart';
import 'package:http/http.dart' as http;
import 'package:gateway/models/auth/signin_response.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/service/service.dart';

final _CollageService CollageService = _CollageService();

class _CollageService extends ApiService with CollageApi {
  @override
  Future<List<Collage>> getCollageList() async {
    http.Response res = await http.get(
      this._getCollageListLURL,
      headers: defaultHeader,
    );

    if (res.statusCode == 200) {
      return ((json.decode(res.body) ?? []) as List<dynamic>)
          .map<Collage>((department) => Collage.fromJson(department))
          .toList();
    }

    throw APIError.fromJSON(json.decode(res.body));
  }

  @override
  Future<Department> getDepartment(String departmentUUID) async{
    http.Response res = await http.get(
      this._getDepartmentURL(departmentUUID),
      headers: defaultHeader,
    );

    if (res.statusCode == 200) {
      return Department.fromJson(json.decode(res.body));
    }

    throw APIError.fromJSON(json.decode(res.body));
  }




}

extension on _CollageService{
  String get _getCollageListLURL => this.baseURL + "/collage/";
  String _getDepartmentURL(String departmentUUID) => this.baseURL + "/department/$departmentUUID";
}