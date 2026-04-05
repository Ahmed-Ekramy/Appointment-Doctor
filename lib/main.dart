import 'package:doc/core/routes/route.dart';
import 'package:doc/doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_route.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  String initialRoute;
  String? token = CacheHelper.getData(key: 'token');

  if (token != null && token.isNotEmpty) {
    initialRoute = Routes.layout;
  } else {
    initialRoute = Routes.onBoarding;
  }

  runApp(DocApp(
    appRoute: AppRoute(),
    initialRoute: initialRoute,
  ));
}
