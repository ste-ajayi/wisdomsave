// To parse this JSON data, do
//
//     final dashboardmodel = dashboardmodelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Dashboardmodel dashboardmodelFromJson(String str) =>
    Dashboardmodel.fromJson(json.decode(str));

String dashboardmodelToJson(Dashboardmodel data) => json.encode(data.toJson());

class Dashboardmodel {
  Dashboardmodel({
    required this.username,
    required this.balance,
  });

  final String username;
  final int balance;

  factory Dashboardmodel.fromJson(Map<String, dynamic> json) => Dashboardmodel(
        username: json["username"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "balance": balance,
      };
}
