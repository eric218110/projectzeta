import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const CreditCartViewAllPage(),
    transitionsBuilder: (_, a1, a2, child) {
      return FadeTransition(opacity: a1, child: child);
    },
  );
}

class CreditCartViewAllPage extends StatelessWidget {
  const CreditCartViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Routefly.pop(context);
          },
          child: const Text("voltar"),
        ),
      ),
    );
  }
}
