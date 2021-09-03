import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignupEvent {
  const SignupEvent();
}

class SignupWillLoad extends SignupEvent {}

class SignupValueWillChange<T> extends SignupEvent {
  final T value;
  final String name;

  SignupValueWillChange({
    this.value,
    this.name,
  });
}

class SignupWillRegistered extends SignupEvent {
}
