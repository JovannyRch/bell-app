// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.user,
    this.token,
  });

  User user;
  String token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.id,
    this.createdAt,
    this.email,
    this.name,
    this.isPremium,
    this.role,
  });

  int id;
  DateTime createdAt;
  String email;
  String name;
  bool isPremium;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        email: json["email"],
        name: json["name"],
        isPremium: json["isPremium"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "email": email,
        "name": name,
        "isPremium": isPremium,
        "role": role,
      };
}
