import 'package:flutter/material.dart';
import 'package:projectzeta/src/main/app/main_app.dart';
import 'package:projectzeta/src/main/di/di.dart';

void main() {
  setupDependencyInjections();

  runApp(const MainApp());
}
