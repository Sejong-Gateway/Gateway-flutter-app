import 'package:login_page/models/tag_model.dart';

class SubjectModel {
  final String name;
  final String major;
  final String type;
  final String semester;
  final List<TagModel> tags;
  final int credit;
  final String enteranceYear;
  final String uuid;

  SubjectModel({
    this.name,
    this.major,
    this.type,
    this.semester,
    this.tags,
    this.credit,
    this.enteranceYear,
    this.uuid
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      name: json["name"] as String,
      major : json["major"] as String,
      type: json["type"] as String,
      semester: json["semester"] as String,
      credit: json["credit"] as int,
      enteranceYear : json["enteranceYear"],
      uuid : json["_id"],
    );
  }
}
