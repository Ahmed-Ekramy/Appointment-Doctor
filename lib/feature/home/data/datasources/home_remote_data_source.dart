import 'package:doc/core/api/api_consumer.dart';

abstract class HomeRemoteDataSource {
  // Future<dynamic> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl({required this.apiConsumer});
}
