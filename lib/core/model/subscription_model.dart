// To parse this JSON data, do
//
//     final subscription = subscriptionFromJson(jsonString);

import 'dart:convert';

import 'package:ijob_app/core/model/plan_model.dart';

Subscription subscriptionFromJson(String str) => Subscription.fromJson(json.decode(str));

String subscriptionToJson(Subscription data) => json.encode(data.toJson());

class Subscription {
  Subscription({
    required this.plan,
    required this.payment,
  });

  final Plan plan;
  final Payment payment;

  Subscription copyWith({
    Plan? plan,
    Payment? payment,
  }) =>
      Subscription(
        plan: plan ?? this.plan,
        payment: payment ?? this.payment,
      );

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        plan: Plan.fromJson(json["plan"]),
        payment: Payment.fromJson(json["payment"]),
      );

  Map<String, dynamic> toJson() => {
        "plan": plan.toJson(),
        "payment": payment.toJson(),
      };
}

class Payment {
  Payment({
    required this.paymentToken,
    required this.customer,
    this.billingAddress,
  });

  final String paymentToken;
  final Customer customer;
  final Address? billingAddress;

  Payment copyWith({
    String? paymentToken,
    Customer? customer,
    Address? billingAddress,
  }) =>
      Payment(
        paymentToken: paymentToken ?? this.paymentToken,
        customer: customer ?? this.customer,
        billingAddress: billingAddress ?? this.billingAddress,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentToken: json["paymentToken"],
        customer: Customer.fromJson(json["customer"]),
        billingAddress: Address.fromJson(json["billingAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "paymentToken": paymentToken,
        "customer": customer.toJson(),
        "billingAddress": billingAddress?.toJson(),
      };
}

class Address {
  Address({
    required this.number,
    required this.neighborhood,
    required this.zipcode,
    required this.city,
    required this.complement,
    required this.state,
    required this.street,
  });
  final int number;
  final String neighborhood;
  final String zipcode;
  final String city;
  final String complement;
  final String state;
  final String street;

  Address copyWith({
    int? number,
    String? neighborhood,
    String? zipcode,
    String? city,
    String? complement,
    String? state,
    String? street,
  }) =>
      Address(
        number: number ?? this.number,
        neighborhood: neighborhood ?? this.neighborhood,
        zipcode: zipcode ?? this.zipcode,
        city: city ?? this.city,
        complement: complement ?? this.complement,
        state: state ?? this.state,
        street: street ?? this.street,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        number: json["number"],
        neighborhood: json["neighborhood"],
        zipcode: json["zipcode"],
        city: json["city"],
        complement: json["complement"],
        state: json["state"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "neighborhood": neighborhood,
        "zipcode": zipcode,
        "city": city,
        "complement": complement,
        "state": state,
        "street": street,
      };
}

class Customer {
  Customer({
    required this.name,
    required this.cpf,
    required this.email,
    required this.birth,
    required this.phoneNumber,
    required this.address,
  });

  final String name;
  final String cpf;
  final String email;
  final DateTime birth;
  final String phoneNumber;
  final Address address;

  Customer copyWith({
    String? name,
    String? cpf,
    String? email,
    DateTime? birth,
    String? phoneNumber,
    Address? address,
  }) =>
      Customer(
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
        email: email ?? this.email,
        birth: birth ?? this.birth,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
        cpf: json["cpf"],
        email: json["email"],
        birth: DateTime.parse(json["birth"]),
        phoneNumber: json["phone_number"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "cpf": cpf,
        "email": email,
        "birth":
            "${birth.year.toString().padLeft(4, '0')}-${birth.month.toString().padLeft(2, '0')}-${birth.day.toString().padLeft(2, '0')}",
        "phone_number": phoneNumber,
        "address": address.toJson(),
      };
}
