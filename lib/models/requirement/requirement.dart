class Requirement {
  final String name;
  final String unit;
  final String uuid;

  Requirement({
    this.name,
    this.unit,
    this.uuid
  });

  factory Requirement.fromJson(Map<String, dynamic> json) {
    return Requirement(
      uuid: json['uuid'] as String ?? "",
      name: json['name'] as String ?? "",
      unit: json['unit'] as String ?? "",
    );
  }
}
