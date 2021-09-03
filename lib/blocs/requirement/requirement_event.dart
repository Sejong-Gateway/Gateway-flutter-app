import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gateway/models/requirement/category.dart';

abstract class RequirementEvent {
  const RequirementEvent();
}

class RequirementWillLoad extends RequirementEvent {
  final List<Category> categories;

  RequirementWillLoad({this.categories});
}

class RequirementInputWillChanged extends RequirementEvent {
  final String categoryUUID;
  final String requirementUUID;
  final int value;

  RequirementInputWillChanged({
    this.categoryUUID,
    this.requirementUUID,
    this.value,
  });
}
