import 'package:flutter/cupertino.dart';

class RequirementRequest {
  final int count;
  final String uuid;

  RequirementRequest({
    @required this.count,
    @required this.uuid,
  });

  factory RequirementRequest.fromMap(Map<String, dynamic> map){
    return RequirementRequest(
      count: map['count'] as int ?? 0,
      uuid: map['uuid'] as String ?? ""
    );
  }
  Map<String, dynamic> get jsonValue {
    return {
      "count": this.count,
      "uuid": this.uuid,
    };
  }
}
