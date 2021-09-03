import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashWillLoad extends SplashEvent {

}
