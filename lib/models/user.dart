import 'dart:convert';

import 'package:quotesapp/models/address.dart';
import 'package:quotesapp/models/employment.dart';
import 'package:quotesapp/models/subscription.dart';

class User {
  final int id;
  final String uid;
  final String password;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String avatar;
  final String gender;
  final String phoneNumber;
  final String socialInsuranceNumber;
  final DateTime dateOfBirth;
  final Employment employment;
  final Address address;
  final CreditCard creditCard;
  final Subscription subscription;

  User({
    required this.id,
    required this.uid,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.avatar,
    required this.gender,
    required this.phoneNumber,
    required this.socialInsuranceNumber,
    required this.dateOfBirth,
    required this.employment,
    required this.address,
    required this.creditCard,
    required this.subscription,
  });

  User copyWith({
    int? id,
    String? uid,
    String? password,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? avatar,
    String? gender,
    String? phoneNumber,
    String? socialInsuranceNumber,
    DateTime? dateOfBirth,
    Employment? employment,
    Address? address,
    CreditCard? creditCard,
    Subscription? subscription,
  }) =>
      User(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
        avatar: avatar ?? this.avatar,
        gender: gender ?? this.gender,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        socialInsuranceNumber:
            socialInsuranceNumber ?? this.socialInsuranceNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        employment: employment ?? this.employment,
        address: address ?? this.address,
        creditCard: creditCard ?? this.creditCard,
        subscription: subscription ?? this.subscription,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uid: json["uid"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        avatar: json["avatar"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        socialInsuranceNumber: json["social_insurance_number"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        employment: Employment.fromJson(json["employment"]),
        address: Address.fromJson(json["address"]),
        creditCard: CreditCard.fromJson(json["credit_card"]),
        subscription: Subscription.fromJson(json["subscription"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "avatar": avatar,
        "gender": gender,
        "phone_number": phoneNumber,
        "social_insurance_number": socialInsuranceNumber,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "employment": employment.toJson(),
        "address": address.toJson(),
        "credit_card": creditCard.toJson(),
        "subscription": subscription.toJson(),
      };
}

class CreditCard {
  final String ccNumber;

  CreditCard({
    required this.ccNumber,
  });

  CreditCard copyWith({
    String? ccNumber,
  }) =>
      CreditCard(
        ccNumber: ccNumber ?? this.ccNumber,
      );

  factory CreditCard.fromRawJson(String str) =>
      CreditCard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        ccNumber: json["cc_number"],
      );

  Map<String, dynamic> toJson() => {
        "cc_number": ccNumber,
      };
}
