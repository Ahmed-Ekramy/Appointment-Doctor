import 'package:dartz/dartz.dart';
import '../repositories/home_repository.dart';

class GetHomeDataUseCase {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  // Future<Either<String, dynamic>> call() {
  //   return repository.getHomeData();
  // }
}
