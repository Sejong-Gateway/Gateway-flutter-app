import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gateway/blocs/requirement/requirement_event.dart';
import 'package:gateway/blocs/requirement/requirement_state.dart';
import 'package:gateway/models/auth/category_request.dart';
import 'package:gateway/models/auth/requirement_request.dart';
import 'package:gateway/models/common.dart';
import 'package:gateway/models/error.dart';
import 'package:gateway/models/requirement/category.dart';
import 'package:gateway/models/requirement/requirement.dart';

class RequirementBloc extends Bloc<RequirementEvent, RequirementState> {
  RequirementBloc() : super(RequirementLoadInProgress());

  List<Category> categories = [];
  List<CategoryRequest> categoryRequests = [];

  @override
  Stream<RequirementState> mapEventToState(RequirementEvent event) async* {
    if (event is RequirementWillLoad) {
      yield* this._mapRequirementWillLoadToState(event);
    } else if (event is RequirementInputWillChanged) {
      yield* this._mapRequirementInputWillChangedToState(event);
    }
  }

  Stream<RequirementState> _mapRequirementWillLoadToState(
      RequirementWillLoad event) async* {
    categories = event.categories;

    categoryRequests = categories.map((category) {
      List<RequirementRequest> requirements = category.requirements.map(
        (requirement) => RequirementRequest(
          uuid: requirement.uuid,
          count: 0,
        ),
      ).toList();
      return CategoryRequest(requirements: requirements, uuid: category.uuid);
    }).toList();

    yield RequirementLoadSuccess(categoryRequests: categoryRequests);
  }

  Stream<RequirementState> _mapRequirementInputWillChangedToState(
      RequirementInputWillChanged event) async* {
    List<CategoryRequest> categoryRequestList =
        categoryRequests.map((categoryRequest) {
      List<RequirementRequest> requirements =
          categoryRequest.requirements.map((requirementRequest) {
        if (requirementRequest.uuid == event.requirementUUID) {
          return RequirementRequest(
            count: event.value,
            uuid: requirementRequest.uuid,
          );
        }
      }).toList();
      return CategoryRequest(
          requirements: requirements, uuid: categoryRequest.uuid);
    }).toList();

    yield RequirementLoadSuccess(categoryRequests: categoryRequestList);
  }

}
