import 'package:doc/core/api/api_consumer.dart';

abstract class ProfileRemoteDataSource {
  // Future<dynamic> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProfileRemoteDataSourceImpl({required this.apiConsumer});
}
