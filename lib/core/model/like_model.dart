import 'dart:convert';

import 'service_model.dart';

Like likeFromJson(String str) => Like.fromJson(json.decode(str));

String likeToJson(Like data) => json.encode(data.toJson());

class Like {
  Like({
    required this.id,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.idEmployee,
    required this.idEmployer,
    required this.service,
  });

  final String id;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String idEmployee;
  final String idEmployer;
  final Service service;

  Like copyWith({
    String? id,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? idEmployee,
    String? idEmployer,
    Service? service,
  }) =>
      Like(
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        idEmployee: idEmployee ?? this.idEmployee,
        idEmployer: idEmployer ?? this.idEmployer,
        service: service ?? this.service,
      );

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idEmployee: json["idEmployee"],
        idEmployer: json["idEmployer"],
        service: Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "idEmployee": idEmployee,
        "idEmployer": idEmployer,
        "service": service.toJson(),
      };
}
