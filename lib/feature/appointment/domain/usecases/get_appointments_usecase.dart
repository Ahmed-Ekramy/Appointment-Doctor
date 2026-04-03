import 'package:dartz/dartz.dart';
import '../repositories/appointment_repository.dart';

class GetAppointmentsUseCase {
  final AppointmentRepository repository;

  GetAppointmentsUseCase(this.repository);

  // Future<Either<String, dynamic>> call() {
  //   return repository.getAppointments();
  // }
}
