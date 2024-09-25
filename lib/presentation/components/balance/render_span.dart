import 'package:flutter/material.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/keyboard/keyboard.dart';
import 'package:projectzeta/presentation/store/store.dart';

class RenderSpan extends StatelessWidget {
  final double balance;

  const RenderSpan({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final store = getIt<ShowYourBalanceStore>();

    return ValueListenableBuilder(
      valueListenable: store,
      builder: (_, state, __) {
        return MoneyText(
          show: state.isShowYourBalance,
          value: balance,
          onTapMoneyText: CalculatorBottomSheet.show,
        );
      },
    );
  }
}
