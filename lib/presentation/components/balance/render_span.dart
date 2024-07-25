import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:provider/provider.dart';

class RenderSpan extends StatelessWidget {
  final double balance;

  const RenderSpan({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowYourBalanceReducer>(
      builder: (_, state, __) {
        return MoneyText(show: state.isShowYourBalance, value: balance);
      },
    );
  }
}
