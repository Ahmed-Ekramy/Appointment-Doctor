import 'package:doc/core/routes/route.dart';
import 'package:flutter/material.dart';

import '../widgets/undefined_widget.dart';


class AppRoute {
  Route generateRoute(RouteSettings settings) {
      switch (settings.name) {
        case Routes.onBoarding:
          return  MaterialPageRoute(builder: (_) => const onBoarding());
        default:
          return MaterialPageRoute(builder: (_) => const UndefinedPage());
      }

  }