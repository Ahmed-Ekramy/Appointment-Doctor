import 'package:dartz/dartz.dart';
import 'package:doc/feature/home/domain/entities/specialty_entity.dart';

abstract class HomeRepository {
  Future<Either<String, List<SpecializationEntity>>> getSpecialty();
}
