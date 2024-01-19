import 'package:appointment/core/routing/app_route.dart';
import 'package:appointment/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/route.dart';

class DocApp extends StatelessWidget {
  const DocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorManager.primaryColor,
          scaffoldBackgroundColor: Colors.white,

        ),
        onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
        initialRoute: Routes.onBoarding,
      ),
    );
  }
}
