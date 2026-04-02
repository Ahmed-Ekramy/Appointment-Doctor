import 'package:doc/core/routes/route.dart';
import 'package:doc/feature/login/Presentation/manager/login_cubit.dart';
import 'package:doc/feature/sign_up/Presentation/manager/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/login/Presentation/page/login_view.dart';
import '../../feature/login/data/datasources/login_remote_data_source.dart';
import '../../feature/login/data/repositories/login_repository_impl.dart';
import '../../feature/login/domain/usecases/login_usecase.dart';
import '../../feature/onboarding/onboarding.dart';
import '../../feature/sign_up/Presentation/page/sign_up_view.dart';
import '../widgets/undefined_widget.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => SignUpCubit(),
            child: const SignUpView(),
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(
              LoginUseCase(LoginRepositoryImpl(LoginRemoteDataSourceImpl())),
            ),
            child: LoginView(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const UndefinedPage());
    }
  }
}
