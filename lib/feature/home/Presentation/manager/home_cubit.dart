

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_doctors_usecase.dart';
import '../../domain/usecases/get_specialty_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSpecialtyUseCase getSpecialtyUseCase;
  final GetDoctorsUseCase getDoctorsUseCase;

  HomeCubit(this.getSpecialtyUseCase, this.getDoctorsUseCase) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getSpecialty() async {
    emit(GetSpecialtyLoading());
    var result = await getSpecialtyUseCase.call();
    result.fold(
      (l) => emit(GetSpecialtyError(l)),
      (r) => emit(GetSpecialtySuccess(r)),
    );
  }

  Future<void> getDoctors() async {
    emit(GetDoctorsLoading());
    var result = await getDoctorsUseCase.call();
    result.fold(
      (l) => emit(GetDoctorsError(l)),
      (r) => emit(GetDoctorsSuccess(r)),
    );
  }
}
