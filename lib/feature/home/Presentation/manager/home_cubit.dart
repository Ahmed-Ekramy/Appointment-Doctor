

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_doctors_usecase.dart';
import '../../domain/usecases/get_specialty_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSpecialtyUseCase getSpecialtyUseCase;
  final GetDoctorsUseCase getDoctorsUseCase;

  HomeCubit(this.getSpecialtyUseCase, this.getDoctorsUseCase) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  // Local cache – populated once fetch succeeds
  List<dynamic> _allDoctors = [];

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
      (r) {
        _allDoctors = r;
        emit(GetDoctorsSuccess(r));
      },
    );
  }

  // Filter the cached list locally – no extra network call
  void searchDoctors(String query) {
    final trimmed = query.trim().toLowerCase();
    if (trimmed.isEmpty) {
      emit(GetDoctorsSuccess(List.from(_allDoctors)));
      return;
    }
    final filtered = _allDoctors
        .where((d) => (d.name as String? ?? '').toLowerCase().contains(trimmed))
        .toList();
    emit(SearchDoctorsSuccess(List.from(filtered)));
  }
}
