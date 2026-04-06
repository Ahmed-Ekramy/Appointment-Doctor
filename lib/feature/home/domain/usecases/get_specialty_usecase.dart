import 'package:dartz/dartz.dart';
import '../entities/specialty_entity.dart';
import '../repositories/home_repository.dart';

class GetSpecialtyUseCase {
  final HomeRepository repository;

  GetSpecialtyUseCase(this.repository);

  Future<Either<String, List<SpecializationEntity>>> call() {
    return repository.getSpecialty();
  }
}
