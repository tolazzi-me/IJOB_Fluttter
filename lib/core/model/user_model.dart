import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bornDate,
    required this.cellPhone,
    required this.genre,
    this.id,
    this.maxDistance,
    this.status,
    this.about,
    this.createdAt,
    this.updatedAt,
    this.verified,
    this.userActiveType,
  });

  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final bool? status;
  final DateTime bornDate;
  final String? about;
  final int? maxDistance;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String cellPhone;
  final bool? verified;
  final String genre;
  final int? userActiveType;

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    bool? status,
    DateTime? bornDate,
    String? about,
    int? maxDistance,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? cellPhone,
    bool? verified,
    String? genre,
    int? userActiveType,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        status: status ?? this.status,
        bornDate: bornDate ?? this.bornDate,
        about: about ?? this.about,
        maxDistance: maxDistance ?? this.maxDistance,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        cellPhone: cellPhone ?? this.cellPhone,
        verified: verified ?? this.verified,
        genre: genre ?? this.genre,
        userActiveType: userActiveType ?? this.userActiveType,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        status: json["status"],
        bornDate: DateTime.parse(json["bornDate"]),
        about: json["about"],
        maxDistance: json["maxDistance"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cellPhone: json["cellPhone"],
        verified: json["verified"],
        genre: json["genre"],
        userActiveType: json["userActiveType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "status": status,
        "bornDate": bornDate.toIso8601String(),
        "about": about,
        "maxDistance": maxDistance,
        if (createdAt != null) "createdAt": createdAt?.toIso8601String(),
        if (updatedAt != null) "updatedAt": updatedAt?.toIso8601String(),
        "cellPhone": cellPhone,
        "verified": verified,
        "genre": genre,
        "userActiveType": userActiveType,
      };
}
