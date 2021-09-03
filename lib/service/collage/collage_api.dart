import 'package:gateway/models/auth/signin_response.dart';
import 'package:gateway/models/department/collage.dart';
import 'package:gateway/models/department/department.dart';

abstract class CollageApi {
  Future<List<Collage>> getCollageList();

  Future<Department> getDepartment(String departmentUUID);
}
