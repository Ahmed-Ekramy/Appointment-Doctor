import 'package:dartz/dartz.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  // Future<Either<String, dynamic>> call() {
  //   return repository.getProfile();
  // }
}
