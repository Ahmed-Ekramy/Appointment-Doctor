
import '../../domain/entities/specialty_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class GetSpecialtyLoading extends HomeState{}
class GetSpecialtySuccess extends HomeState{
  final List<SpecializationEntity> specializationData;

  GetSpecialtySuccess(this.specializationData);
}
class GetSpecialtyError extends HomeState{
  final String error;

  GetSpecialtyError(this.error);
}
