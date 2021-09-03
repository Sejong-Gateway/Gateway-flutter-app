import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gateway/blocs/subject/subject_event.dart';
import 'package:gateway/blocs/subject/subject_state.dart';
import 'package:gateway/models/common.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/models/subject/subject.dart';
import 'package:gateway/service/subject/subject_service.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {

  SubjectBloc() : super(SubjectLoadInProgress());

  @override
  Stream<SubjectState> mapEventToState(SubjectEvent event) async* {
    if (event is SubjectWillLoad) {
      yield* this._mapSubjectWillLoadToState(event);
    }
  }

  Stream<SubjectState> _mapSubjectWillLoadToState(SubjectWillLoad event) async* {
    try {
      List<Subject> subjects = await SubjectService.getSubjectList(
        typeUUID: event.typeUUID,
        departmentUUID: event.departmentUUID,
      );
      yield SubjectLoadSuccess(subjects: subjects);
    } on APIError catch(error) {
      yield SubjectLoadFailure(message: error.message);
    }
  }
}
