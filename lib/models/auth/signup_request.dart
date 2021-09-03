import 'package:gateway/models/auth/category_request.dart';

class SignUpRequest {
  final int studentId;
  final String password;
  final bool isAbeek;
  final int semester;
  final String collageUUID;
  final String departmentUUID;
  final List<String> currentSubjectUUIDs;
  final List<String> completeSubjectUUIDs;
  final List<String> remainSubjectUUIDs;
  final List<CategoryRequest> categories;

  SignUpRequest({
    this.semester,
    this.studentId,
    this.password,
    this.isAbeek,
    this.collageUUID,
    this.departmentUUID,
    this.currentSubjectUUIDs,
    this.completeSubjectUUIDs,
    this.remainSubjectUUIDs,
    this.categories,
  });

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return SignUpRequest(
      semester: map['semester'] as int ?? 0,
      studentId: map['studentId'] as int ?? 0,
      password: map['password'] as String ?? "",
      isAbeek: map['isAbeek'] as bool ?? false,
      collageUUID: map['collageUUID'] as String ?? "",
      departmentUUID: map['departmentUUID'] as String ?? "",
      currentSubjectUUIDs: map['currentSubjectUUIDs']as List<String> ?? [],
      completeSubjectUUIDs: map['completeSubjectUUIDs'] as List<String> ?? [],
      remainSubjectUUIDs: map['remainSubjectUUIDs'] as List<String> ?? [],
      categories: map['categories']
    );
  }

  Map<String, dynamic> get jsonValue {
    return {
      "studentId": this.studentId,
      "password": this.password,
      "isAbeek": this.isAbeek,
      "semester": this.semester,
      "collageUUID": this.collageUUID,
      "departmentUUID": this.departmentUUID,
      "currentSubjectUUIDs": this.currentSubjectUUIDs,
      "completeSubjectUUIDs": this.completeSubjectUUIDs,
      "remainSubjectUUIDs": this.remainSubjectUUIDs,
      "category":
          this.categories.map((requirement) => requirement.jsonValue).toList(),
    };
  }
}
