import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/load_onboarding.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:routefly/routefly.dart';

FutureOr<RouteInformation> splashMiddleware(
    RouteInformation routeInformation) async {
  if (routeInformation.uri.path == routePaths.splash) {
    final onLoadOnboarding = getIt<OnLoadOnboarding>();
    var userEmpty = UserModelIsEmpty();

    var result = await onLoadOnboarding.findByUser(userEmpty);

    if (result.showOnboarding) {
      routeInformation =
          routeInformation.redirect(Uri.parse(routePaths.onboarding));
    } else {
      routeInformation = routeInformation.redirect(Uri.parse(routePaths.home));
    }
  }

  FlutterNativeSplash.remove();
  return routeInformation;
}
