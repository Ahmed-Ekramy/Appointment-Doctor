import 'package:doc/doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_route.dart';
import 'core/utils/observer.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
   Bloc.observer = MyBlocObserver();
  runApp(DocApp(appRoute: AppRoute()));
}
