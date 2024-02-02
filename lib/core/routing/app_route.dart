import 'package:appointment/core/routing/route.dart';
import 'package:appointment/feature/login/data/repositories/login_data_repo.dart';
import 'package:appointment/feature/login/domain/use_cases/login_use_case.dart';
import 'package:appointment/feature/login/presentation/manager/login_cubit.dart';
import 'package:appointment/feature/login/presentation/pages/login_screen.dart';
import 'package:appointment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../onboarding_screen.dart';

class AppRouter {
 static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) {
            return const OnBoardingScreen();
          },
        );
        case Routes.login:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
                create: (context) => LoginCubit(LoginUseCase(getIt.get<LoginDataRepo>())),
                child: const LoginScreen());
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No route defined"),
              ),
            );
          },
        );
    }
  }
}
