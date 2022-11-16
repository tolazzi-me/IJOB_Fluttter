import 'dart:convert';

import 'package:ijob_app/core/model/user_model.dart';

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
    this.user,
  });

  final String id;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String idEmployee;
  final String idEmployer;
  final Service? service;
  final User? user;

  Like copyWith({
    String? id,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? idEmployee,
    String? idEmployer,
    Service? service,
    User? user,
  }) =>
      Like(
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        idEmployee: idEmployee ?? this.idEmployee,
        idEmployer: idEmployer ?? this.idEmployer,
        service: service ?? this.service,
        user: user ?? this.user,
      );

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idEmployee: json["idEmployee"],
        idEmployer: json["idEmployer"],
        service: json['service'] == null ? null : Service.fromJson(json["service"]),
        user: json['user'] == null ? null : User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "idEmployee": idEmployee,
        "idEmployer": idEmployer,
        if (service != null) "service": service!.toJson(),
        if (user != null) "user": user!.toJson(),
      };
}
