import 'package:dartz/dartz.dart';
import 'package:doc/core/api/api_consumer.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/doctor_home_model.dart' as doctor;
import '../models/specialty_model.dart';

abstract class HomeRemoteDataSource {
  Future<Either<String, List<Datum>>> getSpecialty();
  Future<Either<String, List<doctor.Datum>>> getDoctors();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Datum>>> getSpecialty() async {
    try {
      var response = await apiConsumer.get(EndPoint.specialization);
      SpecializationModel specializationModel = SpecializationModel.fromJson(
        response,
      );
      return Right(specializationModel.data ?? []);
    } on ServerException catch (e) {
      return Left(e.errModel.message ?? "Something went wrong");
    }
  }

  @override
  Future<Either<String, List<doctor.Datum>>> getDoctors() async {
    try {
      var response = await apiConsumer.get(EndPoint.doctor);
      doctor.HomeDoctorModel homeDoctorModel = doctor.HomeDoctorModel.fromJson(
        response,
      );
      return Right(homeDoctorModel.data ?? []);
    } on ServerException catch (e) {
      return Left(e.errModel.message ?? "Something went wrong");
    }
  }
}
