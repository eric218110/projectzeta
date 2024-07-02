import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:projectzeta/main/app/main_app.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setupDependencyInjections();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: GradientColors.transparent,
    statusBarBrightness: Brightness.light,
  ));

  setPathUrlStrategy();

  runApp(const MainApp());
}
