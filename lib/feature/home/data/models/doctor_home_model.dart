// To parse this JSON data, do
//
//     final homeDoctorModel = homeDoctorModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'doctor_home_model.g.dart';

HomeDoctorModel homeDoctorModelFromJson(String str) => HomeDoctorModel.fromJson(json.decode(str));

String homeDoctorModelToJson(HomeDoctorModel data) => json.encode(data.toJson());

@JsonSerializable()
class HomeDoctorModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<Datum>? data;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "code")
  int? code;

  HomeDoctorModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory HomeDoctorModel.fromJson(Map<String, dynamic> json) => _$HomeDoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDoctorModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "degree")
  String? degree;
  @JsonKey(name: "specialization")
  Specialization? specialization;
  @JsonKey(name: "city")
  City? city;
  @JsonKey(name: "appoint_price")
  int? appointPrice;
  @JsonKey(name: "start_time")
  String? startTime;
  @JsonKey(name: "end_time")
  String? endTime;

  Datum({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "governrate")
  Specialization? governrate;

  City({
    this.id,
    this.name,
    this.governrate,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Specialization {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  Specialization({
    this.id,
    this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) => _$SpecializationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}
