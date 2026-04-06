import 'package:dartz/dartz.dart';
import 'package:doc/feature/home/domain/entities/specialty_entity.dart';
import '../../data/models/doctor_home_model.dart' as doctor;

abstract class HomeRepository {
  Future<Either<String, List<SpecializationEntity>>> getSpecialty();
  Future<Either<String, List<doctor.Datum>>> getDoctors();
}
