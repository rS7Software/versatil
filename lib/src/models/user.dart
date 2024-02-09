import 'dart:convert';

import 'package:versatil/src/models/rol.dart';

//import 'package:curso_flutter_delivery/src/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? sessionToken;
  String? image;
  List<Rol>? roles = [];

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.sessionToken,
    this.image,
    this.roles
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"] is int ? json['id'].toString() : json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      sessionToken: json["session_token"],
      image: json["image"],
      //roles: json["roles"] == null ? [] : List<Rol>.from(json['roles'].map(model) => Rol.fromJson(model)) ?? []//roles: [{"id" : 1, "name" : "CLIENTE", "image" : null, "route" : "client/products/list"}, {"id" : 2, "name" : "RESTAURANTE", "image" : null, "route" : "restaurant/orders/list"}]
      roles: []
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "session_token": sessionToken,
    "image": image,
    "roles": roles
  };
}