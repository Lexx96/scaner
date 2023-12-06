import 'package:scan_me/di/app_factory.dart';
import 'package:flutter/material.dart';

/// Запуск приложения
void run() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(makeAppFactory.makeApp());
}
