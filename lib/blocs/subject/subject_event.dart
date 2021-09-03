import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SubjectEvent extends Equatable {
  const SubjectEvent();

  @override
  List<Object> get props => [];
}

class SubjectWillLoad extends SubjectEvent {
  final String typeUUID;
  final String departmentUUID;

  SubjectWillLoad({
    this.typeUUID,
    this.departmentUUID,
  });
}
