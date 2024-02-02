import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/di/di.dart';
import 'doc_app.dart';

void main() {
  servicesLocator();
  runApp(const DocApp());
}

final getIt = GetIt.instance;