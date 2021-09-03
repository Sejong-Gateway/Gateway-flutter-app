import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gateway/blocs/collage/collage_event.dart';
import 'package:gateway/blocs/collage/collage_state.dart';
import 'package:gateway/models/common.dart';
import 'package:gateway/models/department/collage.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/service/collage/collage_service.dart';

class CollageBloc extends Bloc<CollageEvent, CollageState> {
  CollageBloc() : super(CollageLoadInProgress());

  @override
  Stream<CollageState> mapEventToState(CollageEvent event) async* {
    if (event is CollageWillLoad) {
      yield* this._mapCollageWillLoadToState(event);
    } else if (event is CollageSearchWillChanged) {
      yield* this._mapCollageSearchWillChangedToState(event);
    }
  }

  Stream<CollageState> _mapCollageSearchWillChangedToState(
      CollageSearchWillChanged event) async* {
    CollageState _state = this.state;
    if (_state is CollageLoadSuccess) {

      List<Collage> filteredCollages = _state.collages
          .where((collage) => collage.departments.any(
              (department) => department.name.indexOf(event.searchValue) != -1))
          .toList();

      yield CollageLoadSuccess(
        filteredCollages: filteredCollages,
        collages: _state.collages,
        searchValue: event.searchValue,
      );
    }
  }

  Stream<CollageState> _mapCollageWillLoadToState(
      CollageWillLoad event) async* {
    try {
      // List<Collage> collages = [Collage.dummy(), Collage.dummy()];
      List<Collage> collages = await CollageService.getCollageList();
      yield CollageLoadSuccess(
        collages: collages,
        filteredCollages: collages,
        searchValue: "",
      );
    } on APIError catch (error) {
      yield CollageLoadFailure(message: error.message);
    }
  }
}
