import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthWillLoad extends AuthEvent {}

class AuthTextFieldWillInputted extends AuthEvent {
  final String name;
  final String value;

  AuthTextFieldWillInputted({
    @required this.name,
    @required this.value,
  });
}

class AuthWillSignedIn extends AuthEvent {
  final Map<String, dynamic> input;

  AuthWillSignedIn({
    this.input,
  });
}
