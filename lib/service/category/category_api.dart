import 'package:gateway/models/auth/signin_response.dart';
import 'package:gateway/models/department/collage.dart';
import 'package:gateway/models/requirement/category.dart';

abstract class CategoryApi {
  Future<List<Category>> getCategoryList();
}
