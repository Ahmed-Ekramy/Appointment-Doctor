import '../../data/models/doctor_home_model.dart' as doctor;
import '../../domain/entities/specialty_entity.dart';

// ignore_for_file: always_declare_return_types

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

// Emitted when a local search filter is applied over the cached list
class SearchDoctorsSuccess extends HomeState {
  final List<doctor.Datum> doctors;

  SearchDoctorsSuccess(this.doctors);
}
