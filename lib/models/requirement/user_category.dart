import 'package:gateway/models/requirement/category.dart';
import 'package:gateway/models/requirement/requirement.dart';
import 'package:gateway/models/requirement/user_requirement.dart';

class UserCategory {
  final String uuid;
  final Category category;
  final List<UserRequirement> requirements;

  UserCategory({
    this.category, this.requirements,
    this.uuid,
  });

  factory UserCategory.fromJson(Map<String, dynamic> json) {
    return UserCategory(
      uuid: json['uuid'] as String ?? "",
      category: Category.fromJson(json['category']),
      requirements: (json['requirements'] as List<dynamic> ?? [])
          .map<UserRequirement>((json) => UserRequirement.fromJson(json))
          .toList(),
    );
  }
}
