import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoadInProgress extends AuthState {}

class AuthLoadSuccess extends AuthState {
  const AuthLoadSuccess();

  @override
  List<Object> get props => [];
}

class AuthNotLoggedIn extends AuthState {}

class AuthSignInSuccess extends AuthState {

}

class AuthTextFieldInputtedSuccess extends AuthState {
  final Map<String, dynamic> input;

  AuthTextFieldInputtedSuccess({this.input});
}

class AuthLoadFailure extends AuthState {
  final String message;

  const AuthLoadFailure({@required this.message});
}
