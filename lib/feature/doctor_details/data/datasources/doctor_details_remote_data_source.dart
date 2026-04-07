import 'package:dartz/dartz.dart';
import 'package:doc/core/api/api_consumer.dart';
import 'package:doc/core/api/end_ponits.dart';
import 'package:doc/core/errors/exceptions.dart';
import '../models/doctor_details_model.dart';

abstract class DoctorDetailsRemoteDataSource {
  Future<Either<String, DoctorDetailsModel>> getDoctorDetails(int id);
}

class DoctorDetailsRemoteDataSourceImpl implements DoctorDetailsRemoteDataSource {
  final ApiConsumer apiConsumer;

  DoctorDetailsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<String, DoctorDetailsModel>> getDoctorDetails(int id) async {
    try {
      final response = await apiConsumer.get(
        EndPoint.doctorDetails(id),
      );
      return Right(DoctorDetailsModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message ?? "Something went wrong");
    }
  }
}
