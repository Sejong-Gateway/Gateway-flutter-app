import 'package:gateway/models/requirement/requirement.dart';

class UserRequirement {
  final int count;
  final String uuid;
  final Requirement requirement;

  UserRequirement( {
    this.requirement,
    this.count,
    this.uuid
  });

  factory UserRequirement.fromJson(Map<String, dynamic> json) {
    return UserRequirement(
      uuid: json['uuid'] as String ?? "",
      count: json['count'] as int ?? 0,
      requirement: Requirement.fromJson(json['requirement']),
    );
  }
}
