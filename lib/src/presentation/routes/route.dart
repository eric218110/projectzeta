import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:projectzeta/src/presentation/screens/home.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
