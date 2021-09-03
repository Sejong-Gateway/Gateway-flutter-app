import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gateway/models/subject/subject.dart';

class SubjectSelectCubit extends Cubit<List<String>>{
  SubjectSelectCubit() : super([]);

  void onAddSubject(String subjectUUID){
    emit([
      ...state,
      subjectUUID,
    ]);
  }

  void onRemoveSubject(String subjectUUID){
    emit(state.where((uuid) => uuid != subjectUUID).toList());
  }
}