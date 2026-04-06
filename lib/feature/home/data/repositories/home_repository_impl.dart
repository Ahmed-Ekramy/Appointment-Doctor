import 'package:dartz/dartz.dart';
import 'package:doc/feature/home/domain/entities/specialty_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/doctor_home_model.dart' as doctor;

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, List<SpecializationEntity>>> getSpecialty() =>
      remoteDataSource.getSpecialty();

  @override
  Future<Either<String, List<doctor.Datum>>> getDoctors() =>
      remoteDataSource.getDoctors();
}
