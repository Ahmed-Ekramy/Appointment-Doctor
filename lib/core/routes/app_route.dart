import 'package:doc/core/routes/route.dart';
import 'package:doc/feature/login/Presentation/manager/login_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/login/Presentation/page/login_view.dart';
import '../../feature/onboarding/onboarding.dart';
import '../widgets/undefined_widget.dart';


class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
        case Routes.login:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => LoginCubit(),
          child: LoginView(),
        ));

      default:
        return MaterialPageRoute(builder: (_) => const UndefinedPage());
    }
  }
  }