import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:routefly/routefly.dart';

FutureOr<RouteInformation> authMiddleware(
    RouteInformation routeInformation) async {
  if (routeInformation.uri.path == routePaths.home) {
    final onLoadOnboarding = getIt<OnLoadUserInStorage>();

    var result = await onLoadOnboarding.load();

    if (result.id == '') {
      routeInformation = routeInformation.redirect(Uri.parse(routePaths.login));
    } else {
      routeInformation = routeInformation.redirect(Uri.parse(routePaths.home));
    }
  }

  FlutterNativeSplash.remove();
  return routeInformation;
}
