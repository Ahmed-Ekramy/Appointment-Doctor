// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'sign_up_response_model.g.dart';

SignUpResponseModel signUpResponseModelFromJson(String str) => SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) => json.encode(data.toJson());

@JsonSerializable()
class SignUpResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "code")
  int? code;

  SignUpResponseModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "username")
  String? username;

  Data({
    this.token,
    this.username,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
