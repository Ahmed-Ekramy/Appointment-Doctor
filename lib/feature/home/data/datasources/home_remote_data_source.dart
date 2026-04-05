import 'package:dartz/dartz.dart';
import 'package:doc/core/api/api_consumer.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/specialty_model.dart';

abstract class HomeRemoteDataSource {
  Future<Either<String, List<Datum>>> getSpecialty();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Datum>>> getSpecialty() async {
    try {
      var response = await apiConsumer.get(EndPoint.specialization);
      SpecializationModel specializationModel = SpecializationModel.fromJson(
        response,
      );
      return Right(specializationModel.data ?? []);
    } on ServerException catch (e) {
      return Left(e.errModel.message??"Something went wrong");
    }
  }
}
