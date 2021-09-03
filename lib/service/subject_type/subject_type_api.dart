import 'package:gateway/models/subject/subject_type.dart';

abstract class SubjectTypeApi {
  Future<List<SubjectType>> getSubjectTypeList();
}
