import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CollageEvent extends Equatable {
  const CollageEvent();

  @override
  List<Object> get props => [];
}

class CollageWillLoad extends CollageEvent {}

class CollageSearchWillChanged extends CollageEvent {
  final String searchValue;

  CollageSearchWillChanged(
    this.searchValue,
  );
}
