import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const HomePage(),
    transitionsBuilder: (_, a1, a2, child) {
      return FadeTransition(opacity: a1, child: child);
    },
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                SizedBox(height: DimensionApplication.extraLarge),
                YourBalance(balance: 1000.12),
                SizedBox(height: DimensionApplication.extraLarge),
                ReceiveAndExpenseButton(),
                SizedBox(height: DimensionApplication.extraLarge),
                ShowCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
