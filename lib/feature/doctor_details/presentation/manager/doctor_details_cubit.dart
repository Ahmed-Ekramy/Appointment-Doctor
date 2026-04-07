import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/doctor_details_repository.dart';
import 'doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  final DoctorDetailsRepository repository;

  DoctorDetailsCubit(this.repository) : super(DoctorDetailsInitial());

  Future<void> getDoctorDetails(int id) async {
    emit(DoctorDetailsLoading());
    final result = await repository.getDoctorDetails(id);
    result.fold(
      (failure) => emit(DoctorDetailsFailure(failure)),
      (doctorDetailsModel) => emit(DoctorDetailsSuccess(doctorDetailsModel)),
    );
  }
}
