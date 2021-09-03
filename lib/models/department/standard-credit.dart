import 'package:gateway/models/department/department.dart';
import 'package:gateway/models/subject/subject_type.dart';

class StandardCredit {
  final String uuid;
  final SubjectType subjectType;
  final String unit;
  final int max;

  StandardCredit({
    this.unit,
    this.max,
    this.uuid,
    this.subjectType,
  });

  factory StandardCredit.fromJson(Map<String, dynamic> json) {
    return StandardCredit(
      uuid: json['uuid'] as String ?? "",
      max: json['max'] as int ?? 0,
      unit: json['unit'] as String ?? "",
      subjectType: SubjectType.fromJson(json['type']),
    );
  }
}
