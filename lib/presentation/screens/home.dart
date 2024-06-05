import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: ListView(
            children: const [
              Header(),
              SizedBox(height: DimensionApplication.extraLarge),
              YourBalance(balance: 1000.12),
              SizedBox(height: DimensionApplication.extraLarge),
              ReceiveAndExpenseButton(),
              SizedBox(height: DimensionApplication.extraLarge),
              ShowCard(),
              SizedBox(
                height: 100,
                width: 500,
                child: Placeholder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
