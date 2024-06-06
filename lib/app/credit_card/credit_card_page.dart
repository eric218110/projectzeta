import 'package:flutter/material.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:routefly/routefly.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes,
      ),
    );
  }
}
