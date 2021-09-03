import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectSelectType {
  final String typeName;
  final String title;
  final String keyName;

  SubjectSelectType({this.typeName, this.title, this.keyName});
}

class SubjectListSelectCubit extends Cubit<int> {
  List<SubjectSelectType> subjectSelectTypes = [
    SubjectSelectType(
      typeName: 'completeSubjectUUIDs',
      title: '이수한 과목을 선택해주세요',
      keyName: 'complete',
    ),
    SubjectSelectType(
      typeName: 'currentSubjectUUIDs',
      title: '이번 학기에 이수할 과목을 선택해주세요',
      keyName: 'current',
    ),
  ];
  SubjectListSelectCubit() : super(0);

  bool onIncreaseState() {
    if (  this.state + 1 >= subjectSelectTypes.length ){
      return true;
    }
    emit(this.state + 1);
    return false;
  }

  void resetState(){
    emit(0);
  }
}
