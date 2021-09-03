import 'package:gateway/models/subject/subject.dart';

abstract class SubjectApi {
  Future<List<Subject>> getSubjectList();
}
