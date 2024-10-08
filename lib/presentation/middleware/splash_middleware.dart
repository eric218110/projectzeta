import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/presentation/store/store.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:routefly/routefly.dart';

FutureOr<RouteInformation> splashMiddleware(
  RouteInformation routeInformation,
) async {
  if (routeInformation.uri.path == routePaths.splash) {
    final onLoadOnboarding = getIt<OnLoadOnboarding>();
    final onLoadUserInStorage = getIt<OnLoadUserInStorage>();
    final formExpenseStore = getIt<FormExpenseStore>();
    final balanceStore = getIt<BalanceStore>();
    final accountStore = getIt<AccountStore>();

    var userInStorage = await onLoadUserInStorage.load();
    var result = await onLoadOnboarding.findByUser(userInStorage);

    await formExpenseStore.nowUsingFormat();
    await balanceStore.onLoadBalanceByUser();
    await accountStore.loadAccountsByUser(userInStorage);

    if (result.showOnboarding) {
      routeInformation = routeInformation.redirect(
        Uri.parse(routePaths.onboarding),
      );
    } else {
      routeInformation = routeInformation.redirect(Uri.parse(routePaths.home));
    }
  }

  return routeInformation;
}
