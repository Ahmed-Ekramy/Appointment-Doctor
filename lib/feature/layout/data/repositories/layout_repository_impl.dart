import '../../domain/repositories/layout_repository.dart';
import '../datasources/layout_remote_data_source.dart';

class LayoutRepositoryImpl implements LayoutRepository {
  final LayoutRemoteDataSource remoteDataSource;

  LayoutRepositoryImpl(this.remoteDataSource);

  // Implement methods here
}
