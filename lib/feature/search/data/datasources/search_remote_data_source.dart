import 'package:doc/core/api/api_consumer.dart';

abstract class SearchRemoteDataSource {
  // Future<dynamic> search(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiConsumer apiConsumer;

  SearchRemoteDataSourceImpl({required this.apiConsumer});
}
