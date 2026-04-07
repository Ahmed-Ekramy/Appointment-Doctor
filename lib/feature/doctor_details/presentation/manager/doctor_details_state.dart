import '../../data/models/doctor_details_model.dart';

abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsSuccess extends DoctorDetailsState {
  final DoctorDetailsModel doctorDetailsModel;

  DoctorDetailsSuccess(this.doctorDetailsModel);
}

class DoctorDetailsFailure extends DoctorDetailsState {
  final String errMessage;

  DoctorDetailsFailure(this.errMessage);
}
