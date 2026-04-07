import 'package:dartz/dartz.dart';
import '../../domain/repositories/doctor_details_repository.dart';
import '../datasources/doctor_details_remote_data_source.dart';
import '../models/doctor_details_model.dart';

class DoctorDetailsRepositoryImpl implements DoctorDetailsRepository {
  final DoctorDetailsRemoteDataSource remoteDataSource;

  DoctorDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, DoctorDetailsModel>> getDoctorDetails(int id) async {
    return await remoteDataSource.getDoctorDetails(id);
  }
}
