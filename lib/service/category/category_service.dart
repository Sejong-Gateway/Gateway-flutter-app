import 'dart:convert';
import 'package:gateway/models/requirement/category.dart';
import 'package:gateway/service/category/category_api.dart';
import 'package:http/http.dart' as http;
import 'package:gateway/models/error.dart';
import 'package:gateway/service/service.dart';

final _CategoryService CategoryService = _CategoryService();

class _CategoryService extends ApiService with CategoryApi {
  @override
  Future<List<Category>> getCategoryList() async {
    http.Response res = await http.get(
      this._getCategoryListLURL,
      headers: defaultHeader,
    );

    if (res.statusCode == 200) {
      return ((json.decode(res.body) ?? []) as List<dynamic>)
          .map<Category>((category) => Category.fromJson(category))
          .toList();
    }

    throw APIError.fromJSON(json.decode(res.body));
  }
}

extension on _CategoryService{
  String get _getCategoryListLURL => this.baseURL + "/category/";
}