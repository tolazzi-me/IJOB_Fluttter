import 'dart:convert';

import 'package:ijob_app/core/model/service_category_model.dart';
import 'package:ijob_app/core/model/service_photo_model.dart';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    required this.title,
    required this.description,
    this.id,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.closed,
    this.serviceCategory,
    this.servicePhotos,
  });

  final String? id;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String title;
  final String description;
  final String? createdBy;
  final bool? closed;
  final ServiceCategory? serviceCategory;
  final List<ServicePhoto>? servicePhotos;

  Service copyWith({
    String? id,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    String? description,
    String? createdBy,
    bool? closed,
    ServiceCategory? serviceCategory,
    List<ServicePhoto>? servicePhotos,
  }) =>
      Service(
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        title: title ?? this.title,
        description: description ?? this.description,
        createdBy: createdBy ?? this.createdBy,
        closed: closed ?? this.closed,
        serviceCategory: serviceCategory ?? this.serviceCategory,
      );

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        title: json["title"],
        description: json["description"],
        createdBy: json["createdBy"],
        closed: json["closed"],
        serviceCategory: json['serviceCategory'] == null ? null : ServiceCategory.fromJson(json['serviceCategory']),
        servicePhotos: json['servicePhotos'] == null ? null : (json['servicePhotos'] as List).map((e) => ServicePhoto.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        if (isDeleted != null) "isDeleted": isDeleted,
        if (createdAt != null) "createdAt": createdAt?.toIso8601String(),
        if (updatedAt != null) "updatedAt": updatedAt?.toIso8601String(),
        "title": title,
        "description": description,
        if (createdBy != null) "createdBy": createdBy,
        if (closed != null) "closed": closed,
        if (serviceCategory != null) "serviceCategory": serviceCategory?.toJson(),
        if (servicePhotos != null && servicePhotos!.isNotEmpty) "servicePhotos": servicePhotos!.map((e) => e.toJson())
      };
}
