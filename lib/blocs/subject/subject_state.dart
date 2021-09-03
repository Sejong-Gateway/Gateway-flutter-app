import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gateway/models/subject/subject.dart';

abstract class SubjectState {
  const SubjectState();
}

class SubjectLoadInProgress extends SubjectState {}

class SubjectLoadSuccess extends SubjectState {
  final List<Subject> subjects;

  const SubjectLoadSuccess({
    this.subjects,
  });
}

class SubjectLoadFailure extends SubjectState {
  final String message;

  const SubjectLoadFailure({@required this.message});
}
