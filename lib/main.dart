import 'package:doc/doc.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_route.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(DocApp(appRoute: AppRoute()));
}
