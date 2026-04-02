import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  ErrorModel({this.message, this.data, this.status, this.code});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    status: json["status"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "status": status,
    "code": code,
  };
}

class Data {
  List<String>? name;
  List<String>? email;
  List<String>? phone;
  List<String>? gender;
  List<String>? password;

  Data({this.name, this.email, this.phone, this.gender, this.password});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"] == null
        ? []
        : List<String>.from(json["name"]!.map((x) => x)),
    email: json["email"] == null
        ? []
        : List<String>.from(json["email"]!.map((x) => x)),
    phone: json["phone"] == null
        ? []
        : List<String>.from(json["phone"]!.map((x) => x)),
    gender: json["gender"] == null
        ? []
        : List<String>.from(json["gender"]!.map((x) => x)),
    password: json["password"] == null
        ? []
        : List<String>.from(json["password"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? [] : List<dynamic>.from(name!.map((x) => x)),
    "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
    "phone": phone == null ? [] : List<dynamic>.from(phone!.map((x) => x)),
    "gender": gender == null ? [] : List<dynamic>.from(gender!.map((x) => x)),
    "password": password == null
        ? []
        : List<dynamic>.from(password!.map((x) => x)),
  };
}
