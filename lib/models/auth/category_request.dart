import 'package:flutter/cupertino.dart';
import 'package:gateway/models/auth/requirement_request.dart';

class CategoryRequest {
  final List<RequirementRequest> requirements;
  final String uuid;

  CategoryRequest({
    @required this.requirements,
    @required this.uuid,
  });

  factory CategoryRequest.fromMap(Map<String, dynamic> map) {
    return CategoryRequest(
        uuid: map['uuid'],
        requirements: (map['requirements'] as List<dynamic> ?? []).map(
          (requirement) => RequirementRequest.fromMap(requirement),
        ));
  }

  Map<String, dynamic> get jsonValue {
    return {
      "requirements": this
          .requirements
          .map((requirement) => requirement.jsonValue)
          .toList(),
      "uuid": this.uuid,
    };
  }
}
