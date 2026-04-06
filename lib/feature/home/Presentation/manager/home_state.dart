import '../../data/models/doctor_home_model.dart' as doctor;
import '../../domain/entities/specialty_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetSpecialtyLoading extends HomeState {}

class GetSpecialtySuccess extends HomeState {
  final List<SpecializationEntity> specializationData;

  GetSpecialtySuccess(this.specializationData);
}

class GetSpecialtyError extends HomeState {
  final String error;

  GetSpecialtyError(this.error);
}

class GetDoctorsLoading extends HomeState {}

class GetDoctorsSuccess extends HomeState {
  final List<doctor.Datum> doctors;

  GetDoctorsSuccess(this.doctors);
}

class GetDoctorsError extends HomeState {
  final String error;

  GetDoctorsError(this.error);
}
