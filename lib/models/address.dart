import 'dart:convert';

import 'package:quotesapp/models/coordinates.dart';

class Address {
  final String city;
  final String streetName;
  final String streetAddress;
  final String zipCode;
  final String state;
  final String country;
  final Coordinates coordinates;

  Address({
    required this.city,
    required this.streetName,
    required this.streetAddress,
    required this.zipCode,
    required this.state,
    required this.country,
    required this.coordinates,
  });

  Address copyWith({
    String? city,
    String? streetName,
    String? streetAddress,
    String? zipCode,
    String? state,
    String? country,
    Coordinates? coordinates,
  }) =>
      Address(
        city: city ?? this.city,
        streetName: streetName ?? this.streetName,
        streetAddress: streetAddress ?? this.streetAddress,
        zipCode: zipCode ?? this.zipCode,
        state: state ?? this.state,
        country: country ?? this.country,
        coordinates: coordinates ?? this.coordinates,
      );

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        streetName: json["street_name"],
        streetAddress: json["street_address"],
        zipCode: json["zip_code"],
        state: json["state"],
        country: json["country"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "street_name": streetName,
        "street_address": streetAddress,
        "zip_code": zipCode,
        "state": state,
        "country": country,
        "coordinates": coordinates.toJson(),
      };
}
