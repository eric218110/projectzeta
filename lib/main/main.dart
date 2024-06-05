import 'package:flutter/material.dart';
import 'package:projectzeta/main/app/main_app.dart';
import 'package:projectzeta/main/di/di.dart';

void main() {
  setupDependencyInjections();

  runApp(const MainApp());
}
