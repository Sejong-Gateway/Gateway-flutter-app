import 'package:login_page/models/subject_model.dart';

abstract class SubjectApi {
  Future<List<SubjectModel>> getSubject(String major);
}

