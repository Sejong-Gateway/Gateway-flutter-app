import 'package:gateway/models/requirement/requirement.dart';

class Category {
  final String uuid;
  final String title;
  final String description;
  final List<Requirement> requirements;

  Category({
    this.uuid,
    this.title,
    this.description,
    this.requirements,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      uuid: json['uuid'] as String ?? "",
      title: json['title'] as String ?? "",
      description: json['description'] as String ?? "",
      requirements: (json['requirements'] as List<dynamic> ?? [])
          .map<Requirement>((json) => Requirement.fromJson(json))
          .toList(),
    );
  }
}
