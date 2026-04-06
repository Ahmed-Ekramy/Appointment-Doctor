import 'package:dartz/dartz.dart';
import '../../data/models/doctor_home_model.dart' as doctor;
import '../repositories/home_repository.dart';

class GetDoctorsUseCase {
  final HomeRepository repository;

  GetDoctorsUseCase(this.repository);

  Future<Either<String, List<doctor.Datum>>> call() {
    return repository.getDoctors();
  }
}
