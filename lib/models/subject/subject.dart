import 'package:gateway/models/department/department.dart';
import 'package:gateway/models/subject/subject_type.dart';

class Subject {
  final String uuid;
  final String name;
  final int credit;
  final int grade;
  final int semester;
  final SubjectType type;
  final Department department;

  Subject({
    this.uuid,
    this.name,
    this.credit,
    this.grade,
    this.semester,
    this.type,
    this.department,
  });

  factory Subject.fromJson(Map<String, dynamic> json){
    return Subject(
      uuid: json['uuid'] as String ?? "",
      name: json['name'] as String ?? "",
      credit: json['credit'] as int ?? 0,
      grade: json['grade'] as int ?? 0,
      semester: json['semester'] as int ?? 0,
      type: SubjectType.fromJson(json['type']),
      department: Department.fromJson(json['department']),
    );
  }
}
