import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/store.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final balanceStore = getIt<BalanceStore>();

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: DimensionApplication.extraLarge),
                ValueListenableBuilder(
                  valueListenable: balanceStore,
                  builder: (_, s, __) => YourBalance(balance: s.value),
                ),
                const SizedBox(height: DimensionApplication.extraLarge),
                const ReceiveAndExpenseButton(),
                const SizedBox(height: DimensionApplication.extraLarge),
                const ShowCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
