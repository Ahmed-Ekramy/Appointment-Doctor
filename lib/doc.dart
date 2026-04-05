import 'package:doc/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_route.dart';
import 'core/routes/route.dart';
import 'core/utils/responsive_size.dart';

class DocApp extends StatelessWidget {
  final AppRoute appRoute;
  final String initialRoute;
  const DocApp({super.key, required this.appRoute, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.init(context);
    return MaterialApp(
      initialRoute: initialRoute,
      onGenerateRoute: appRoute.generateRoute,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
