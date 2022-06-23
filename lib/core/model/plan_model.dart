import 'dart:convert';

Plan planFromJson(String str) => Plan.fromJson(json.decode(str));

String planToJson(Plan data) => json.encode(data.toJson());

class Plan {
  Plan({
    required this.id,
    required this.interval,
    this.repeats,
    required this.integrationId,
    required this.description,
    required this.planAttributes,
    required this.priceInCents,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final int interval;
  final int? repeats;
  final int integrationId;
  final String description;
  final List<PlanAttributes> planAttributes;
  final int priceInCents;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Plan copyWith({
    String? id,
    int? interval,
    int? repeats,
    int? integrationId,
    String? description,
    List<PlanAttributes>? planAttributes,
    int? priceInCents,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Plan(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        interval: interval ?? this.interval,
        repeats: repeats ?? this.repeats,
        integrationId: integrationId ?? this.integrationId,
        description: description ?? this.description,
        planAttributes: planAttributes ?? this.planAttributes,
        priceInCents: priceInCents ?? this.priceInCents,
        isActive: isActive ?? this.isActive,
      );

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        interval: json["interval"],
        repeats: json["repeats"],
        integrationId: json["integrationId"],
        description: json["description"],
        planAttributes: List<PlanAttributes>.from(json["data"].map((x) => PlanAttributes.fromJson(x))),
        priceInCents: json["priceInCents"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "interval": interval,
        "repeats": repeats,
        "integrationId": integrationId,
        "description": description,
        "data": List<dynamic>.from(planAttributes.map((x) => x.toJson())),
        "priceInCents": priceInCents,
        "isActive": isActive,
      };
}

class PlanAttributes {
  PlanAttributes({
    required this.key,
    required this.type,
    required this.value,
  });

  final String key;
  final int type;
  final int value;

  PlanAttributes copyWith({
    String? key,
    int? type,
    int? value,
  }) =>
      PlanAttributes(
        key: key ?? this.key,
        type: type ?? this.type,
        value: value ?? this.value,
      );

  factory PlanAttributes.fromJson(Map<String, dynamic> json) => PlanAttributes(
        key: json["key"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "type": type,
        "value": value,
      };
}
