import 'dart:convert';

ServiceCategory serviceCategoryFromJson(String str) => ServiceCategory.fromJson(json.decode(str));

String serviceCategoryToJson(ServiceCategory data) => json.encode(data.toJson());

class ServiceCategory {
  ServiceCategory({
    required this.id,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.isActive,
    required this.createdBy,
  });

  final String id;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final bool isActive;
  final String createdBy;

  ServiceCategory copyWith({
    String? id,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    bool? isActive,
    String? createdBy,
  }) =>
      ServiceCategory(
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        description: description ?? this.description,
        isActive: isActive ?? this.isActive,
        createdBy: createdBy ?? this.createdBy,
      );

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": name,
        "description": description,
        "isActive": isActive,
        "createdBy": createdBy,
      };
}
