import 'package:dio/dio.dart';
import 'package:doc/core/routes/route.dart';
import 'package:doc/feature/layout/presentation/page/layout_view.dart';
import 'package:doc/feature/login/Presentation/manager/login_cubit.dart';
import 'package:doc/feature/sign_up/Presentation/manager/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:doc/core/api/dio_consumer.dart';
import 'package:doc/feature/doctor_details/data/datasources/doctor_details_remote_data_source.dart';
import 'package:doc/feature/doctor_details/data/repositories/doctor_details_repository_impl.dart';
import 'package:doc/feature/doctor_details/presentation/manager/doctor_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/doctor_details/presentation/page/doctor_details_view.dart';
import '../../feature/home/Presentation/manager/home_cubit.dart';
import '../../feature/home/data/datasources/home_remote_data_source.dart';
import '../../feature/home/data/repositories/home_repository_impl.dart';
import '../../feature/home/domain/usecases/get_doctors_usecase.dart';
import '../../feature/home/domain/usecases/get_specialty_usecase.dart';
import '../../feature/login/Presentation/page/login_view.dart';
import '../../feature/login/data/datasources/login_remote_data_source.dart';
import '../../feature/login/data/repositories/login_repository_impl.dart';
import '../../feature/login/domain/usecases/login_usecase.dart';
import '../../feature/onboarding/onboarding.dart';
import '../../feature/sign_up/Presentation/page/sign_up_view.dart';
import '../../feature/sign_up/data/datasources/sign_up_remote_data_source.dart';
import '../../feature/sign_up/data/repositories/sign_up_repository_impl.dart';
import '../../feature/sign_up/domain/usecases/sign_up_usecase.dart';
import '../../feature/home/Presentation/page/speciality_view.dart';
import '../../feature/home/Presentation/page/recommendation_doctor_view.dart';
import '../api/dio_consumer.dart';
import '../widgets/undefined_widget.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => SignUpCubit(
              SignUpUseCase(
                SignUpRepositoryImpl(
                  SignUpRemoteDataSourceImpl(
                    apiConsumer: DioConsumer(dio: Dio()),
                  ),
                ),
              ),
            ),
            child: const SignUpView(),
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(
              LoginUseCase(
                LoginRepositoryImpl(
                  LoginRemoteDataSourceImpl(
                    apiConsumer: DioConsumer(dio: Dio()),
                  ),
                ),
              ),
            ),
            child: LoginView(),
          ),
        );
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      case Routes.speciality:
        return MaterialPageRoute(builder: (_) => BlocProvider(

            create: (BuildContext context) => HomeCubit(
                GetSpecialtyUseCase(
                  HomeRepositoryImpl(
                    HomeRemoteDataSourceImpl(
                      apiConsumer: DioConsumer(dio: Dio()),
                    ),
                  ),

            ),
              GetDoctorsUseCase(
                HomeRepositoryImpl(
                  HomeRemoteDataSourceImpl(
                    apiConsumer: DioConsumer(dio: Dio()),
                  ),
                ),
            ))..getSpecialty(),
        child: const SpecialityView()));

      case Routes.recommendationDoctor:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => HomeCubit(
              GetSpecialtyUseCase(
                HomeRepositoryImpl(
                  HomeRemoteDataSourceImpl(
                    apiConsumer: DioConsumer(dio: Dio()),
                  ),
                ),
              ),
              GetDoctorsUseCase(
                HomeRepositoryImpl(
                  HomeRemoteDataSourceImpl(
                    apiConsumer: DioConsumer(dio: Dio()),
                  ),
                ),
              ),
            ),
            child: const RecommendationDoctorView(),
          ),
        );
      case Routes.doctorDetails:
        final int id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DoctorDetailsCubit(
              DoctorDetailsRepositoryImpl(
                remoteDataSource: DoctorDetailsRemoteDataSourceImpl(
                  apiConsumer: DioConsumer(dio: Dio()),
                ),
              ),
            )..getDoctorDetails(id),
            child: const DoctorDetailsView(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const UndefinedPage());
    }
  }
}
