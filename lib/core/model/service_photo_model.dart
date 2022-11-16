import 'dart:convert';

ServicePhoto servicePhotoFromJson(String str) => ServicePhoto.fromJson(json.decode(str));

String servicePhotoToJson(ServicePhoto data) => json.encode(data.toJson());

class ServicePhoto {
  ServicePhoto({
    required this.id,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    required this.filename,
    required this.createdBy,
  });

  final String id;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String url;
  final String filename;
  final String createdBy;

  ServicePhoto copyWith({
    String? id,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? url,
    String? filename,
    String? createdBy,
  }) =>
      ServicePhoto(
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        url: url ?? this.url,
        filename: filename ?? this.filename,
        createdBy: createdBy ?? this.createdBy,
      );

  factory ServicePhoto.fromJson(Map<String, dynamic> json) => ServicePhoto(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        url: json["url"],
        filename: json["filename"],
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "url": url,
        "filename": filename,
        "createdBy": createdBy,
      };
}
