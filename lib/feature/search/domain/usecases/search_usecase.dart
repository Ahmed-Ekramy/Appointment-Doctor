import 'package:dartz/dartz.dart';
import '../repositories/search_repository.dart';

class SearchUseCase {
  final SearchRepository repository;

  SearchUseCase(this.repository);

  // Future<Either<String, dynamic>> call(String query) {
  //   return repository.search(query);
  // }
}
