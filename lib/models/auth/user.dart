import 'package:gateway/models/department/collage.dart';
import 'package:gateway/models/department/department.dart';
import 'package:gateway/models/requirement/category.dart';
import 'package:gateway/models/requirement/user_category.dart';
import 'package:gateway/models/subject/subject.dart';

class User {
  final String uuid;
  final int studentId;
  final bool isAbeek;
  final int semester;
  final Department department;
  final List<Subject> currentSubjects;
  final List<Subject> completeSubjects;
  final List<Subject> remainSubjects;
  final List<UserCategory> userCategories;

  User({
    this.uuid,
    this.studentId,
    this.isAbeek,
    this.semester,
    this.department,
    this.currentSubjects,
    this.completeSubjects,
    this.remainSubjects,
    this.userCategories,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'] as String ?? "",
      studentId: json['studentId'] as int ?? 0,
      isAbeek: json['isAbeek'] as bool ?? false,
      semester: json['semester'] as int ?? 0,
      department: Department.fromJson(json['department']),
      currentSubjects: (json['currentSubjects'] as List<dynamic> ?? [])
          .map((json) => Subject.fromJson(json))
          .toList(),
      completeSubjects: (json['completeSubjects'] as List<dynamic> ?? [])
          .map((json) => Subject.fromJson(json))
          .toList(),
      remainSubjects: (json['remainSubjects'] as List<dynamic> ?? [])
          .map((json) => Subject.fromJson(json))
          .toList(),
      userCategories: (json['categories'] as List<dynamic> ?? [])
          .map((json) => UserCategory.fromJson(json))
          .toList(),
    );
  }
}
