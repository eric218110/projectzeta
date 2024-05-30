import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/src/presentation/components/balance/your_balance.dart';
import 'package:projectzeta/src/presentation/components/header/header.dart';
import 'package:projectzeta/src/presentation/components/receive_and_expense/receive_and_expense_button.dart';
import 'package:projectzeta/src/presentation/theme/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: DimensionApplication.extraLarge,
              ),
              YourBalance(
                balance: 1000.25,
              ),
              SizedBox(height: DimensionApplication.extraLarge),
              ReceiveAndExpenseButton()
            ],
          ),
        ),
      ),
    );
  }
}
