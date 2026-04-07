import 'package:dartz/dartz.dart';
import '../../data/models/doctor_details_model.dart';

abstract class DoctorDetailsRepository {
  Future<Either<String, DoctorDetailsModel>> getDoctorDetails(int id);
}
