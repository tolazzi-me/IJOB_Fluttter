import 'dart:convert';

UserLocation userLocationFromJson(String str) => UserLocation.fromJson(json.decode(str));

String userLocationToJson(UserLocation data) => json.encode(data.toJson());

class UserLocation {
  UserLocation({
    required this.id,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.idUser,
    required this.geom,
  });

  final String id;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String idUser;
  final Geom geom;

  UserLocation copyWith({
    String? id,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? idUser,
    Geom? geom,
  }) =>
      UserLocation(
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        idUser: idUser ?? this.idUser,
        geom: geom ?? this.geom,
      );

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idUser: json["idUser"],
        geom: Geom.fromJson(json["geom"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "idUser": idUser,
        "geom": geom.toJson(),
      };
}

class Geom {
  Geom({
    required this.coordinates,
    required this.type,
  });

  final List<double> coordinates;
  final String type;

  Geom copyWith({
    List<double>? coordinates,
    String? type,
  }) =>
      Geom(
        coordinates: coordinates ?? this.coordinates,
        type: type ?? this.type,
      );

  factory Geom.fromJson(Map<String, dynamic> json) => Geom(
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}
