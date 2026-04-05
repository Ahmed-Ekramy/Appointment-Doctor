

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_specialty_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetSpecialtyUseCase getSpecialtyUseCase;

  HomeCubit(this.getSpecialtyUseCase) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getSpecialty() async {
    emit(GetSpecialtyLoading());
    var result = await getSpecialtyUseCase.call();
    result.fold((l) => emit(GetSpecialtyError(l)), (r) => emit(GetSpecialtySuccess(r)));
  }
}
