import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/screens/home/home.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const HomeScreen(),
    transitionsBuilder: (_, a1, a2, child) {
      return FadeTransition(opacity: a1, child: child);
    },
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
