import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentantion/components/balance/your_balance.dart';
import 'package:projectzeta/src/presentantion/components/header/header.component.dart';
import 'package:projectzeta/src/presentantion/theme/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: DimensionApplication.extraLarge,
            ),
            YourBalance()
          ],
        ),
      ),
    );
  }
}
