import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../home/Presentation/manager/home_cubit.dart';
import '../../../home/Presentation/page/home_view.dart';
import '../../../home/data/datasources/home_remote_data_source.dart';
import '../../../home/data/repositories/home_repository_impl.dart';
import '../../../home/domain/usecases/get_doctors_usecase.dart';
import '../../../home/domain/usecases/get_specialty_usecase.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (BuildContext context) {
        return HomeCubit(
          GetSpecialtyUseCase(
            HomeRepositoryImpl(
              HomeRemoteDataSourceImpl(apiConsumer: DioConsumer(dio: Dio()))
            ),
          ),
          GetDoctorsUseCase( HomeRepositoryImpl(
            HomeRemoteDataSourceImpl(apiConsumer: DioConsumer(dio: Dio()))
          ),
          ),
        )..getSpecialty()..getDoctors();
      },
      child: const HomeView(),
    ),
    const Center(child: Text('Chat Screen')),
    const Center(child: Text('Search Screen')),
    const Center(child: Text('My Appointment Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  void changeTab(int index) {
    currentIndex = index;
    emit(LayoutTabChanged(index));
  }
}
