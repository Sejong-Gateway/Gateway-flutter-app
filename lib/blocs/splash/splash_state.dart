import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashLoadInProgress extends SplashState { }

class SplashLoadSuccess extends SplashState {
  const SplashLoadSuccess();

  @override
  List<Object> get props => [];
}

class SplashNotLoggedIn extends SplashState{

}

class SplashLoggedIn extends SplashState{

}

class SplashLoadFailure extends SplashState {
  final String message;

  const SplashLoadFailure({
    @required this.message
  });
}
