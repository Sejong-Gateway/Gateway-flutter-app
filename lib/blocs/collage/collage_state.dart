import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gateway/models/department/collage.dart';

abstract class CollageState {
  const CollageState();
}

class CollageLoadInProgress extends CollageState {}

class CollageLoadSuccess extends CollageState {
  const CollageLoadSuccess({
    this.collages,
    this.filteredCollages,
    this.searchValue,
  });
  final List<Collage> filteredCollages;
  final List<Collage> collages;
  final String searchValue;
}

class CollageLoadFailure extends CollageState {
  final String message;

  const CollageLoadFailure({@required this.message});
}
