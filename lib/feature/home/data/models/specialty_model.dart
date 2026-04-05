// To parse this JSON data, do
//
//     final specializationModel = specializationModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import '../../domain/entities/specialty_entity.dart';

part 'specialty_model.g.dart';

SpecializationModel specializationModelFromJson(String str) => SpecializationModel.fromJson(json.decode(str));

String specializationModelToJson(SpecializationModel data) => json.encode(data.toJson());

@JsonSerializable()
class SpecializationModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  List<Datum>? data;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "code")
  int? code;

  SpecializationModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) => _$SpecializationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationModelToJson(this);
}

@JsonSerializable()
class Datum extends SpecializationEntity{
  @JsonKey(name: "doctors")
  List<Doctor>? doctors;
  Datum({
    required super.id,
    required super.name,
    this.doctors,
  });


  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Doctor {
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

  Doctor({
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

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
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
