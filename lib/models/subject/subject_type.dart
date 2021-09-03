import 'package:flutter/cupertino.dart';

class SubjectType {
  final String uuid;
  final String name;

  SubjectType({
    @required this.uuid,
    @required this.name,
  });

  factory SubjectType.fromJson(Map<String, dynamic> json){
    return SubjectType(
      name: json['name'] as String ?? "",
      uuid: json['uuid'] as String ?? "",
    );
  }
}
