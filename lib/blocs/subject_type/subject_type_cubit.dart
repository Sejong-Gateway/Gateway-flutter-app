import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/models/subject/subject_type.dart';
import 'package:gateway/service/subject_type/subject_type_service.dart';

class SubjectTypeCubit extends Cubit<List<SubjectType>> {
  SubjectTypeCubit() : super(null);

  void getSubjectTypes() async {
    List<SubjectType> subjectTypes =
        await SubjectTypeService.getSubjectTypeList();

    emit(subjectTypes);
  }
}
