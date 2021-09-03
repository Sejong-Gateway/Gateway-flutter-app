import 'package:gateway/models/department/collage.dart';
import 'package:gateway/models/department/standard-credit.dart';

class Department {
  final String name;
  final String uuid;
  final Collage collage;
  final List<StandardCredit> standardCredits;

  Department({
    this.standardCredits,
    this.name,
    this.uuid,
    this.collage,
  });

  factory Department.fromJson(Map<String, dynamic> json){
    return Department(
      name: json['name'] as String ?? "",
      uuid: json['uuid'] as String ?? "",
      standardCredits: ((json["standardCredits"] ?? []) as List<dynamic>)
          .map<StandardCredit>((standardCredit) => StandardCredit.fromJson(standardCredit))
          .toList(),
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
