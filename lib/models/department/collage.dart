import 'package:gateway/models/department/department.dart';

class Collage {
  final String name;
  final String uuid;
  final List<Department> departments;

  Collage({
    this.name,
    this.uuid,
    this.departments,
  });

  factory Collage.fromJson(Map<String, dynamic> json){
    print(json);
    return Collage(
      name: json['name'] as String ?? "",
      uuid: json['uuid'] as String ?? "",
      departments: ((json["departments"] ?? []) as List<dynamic>)
          .map<Department>((department) => Department.fromJson(department))
          .toList(),
    );
  }

  factory Collage.dummy(){
    return Collage(
        name: '소프트웨어융합대학',
        uuid: '1234',
      departments: [
        Department.dummy(),
        Department.dummy(),
      ]
    );
  }
}
