import 'package:doc/core/api/api_consumer.dart';

abstract class AppointmentRemoteDataSource {
  // Future<dynamic> getAppointments();
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final ApiConsumer apiConsumer;

  AppointmentRemoteDataSourceImpl({required this.apiConsumer});
}
