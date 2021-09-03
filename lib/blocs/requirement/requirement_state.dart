import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gateway/models/auth/category_request.dart';

abstract class RequirementState {
  const RequirementState();
}

class RequirementLoadInProgress extends RequirementState {}

class RequirementLoadSuccess extends RequirementState {
  final List<CategoryRequest> categoryRequests;

  const RequirementLoadSuccess({
    this.categoryRequests,
  });
}

class RequirementLoadFailure extends RequirementState {
  final String message;

  const RequirementLoadFailure({@required this.message});
}
