import 'package:gateway/models/department/collage.dart';

class Department {
  final String name;
  final String uuid;
  final Collage collage;

  Department({
    this.name,
    this.uuid,
    this.collage,
  });

  factory Department.fromJson(Map<String, dynamic> json){
    return Department(
      name: json['name'] as String ?? "",
      uuid: json['uuid'] as String ?? "",
      // collage: Collage.fromJson(json['collage']),
    );
  }

  factory Department.dummy(){
    return Department(
      name: '소프트웨어학과',
      uuid: '1111',
      //collage: Collage.dummy(),
    );
  }

}
