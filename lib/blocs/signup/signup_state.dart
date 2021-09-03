import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gateway/models/auth/signup_request.dart';

abstract class SignupState {
  const SignupState();
}

class SignupLoadInProgress extends SignupState {}

class SignupLoadSuccess extends SignupState {
  const SignupLoadSuccess();
}

class SignupDateInputted extends SignupState {
  final Map<String, dynamic> input;
  final SignUpRequest signUpRequest;

  SignupDateInputted({
    this.signUpRequest,
    this.input,
  });
}

class SignupSuccess extends SignupState{

}
class SignupLoadFailure extends SignupState {
  final String message;

  const SignupLoadFailure({@required this.message});
}
