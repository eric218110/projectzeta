import 'package:flutter/material.dart';
import 'package:projectzeta/domain/use_cases/format/format.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/reducer/show_your_balance.reducer.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class RenderSpan extends StatelessWidget {
  final double balance;

  const RenderSpan({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final formatBalance = getIt<FormatBalance>();
    final moneyFormat = formatBalance.onFormatByDouble(balance);

    String moneyHideText = moneyFormat.money
        .replaceAll(R.strings.currencyType, '')
        .split('')
        .map((char) => char == ' ' ? ' ' : '-')
        .join('');

    String centHideText = moneyFormat.cents
        .split('')
        .map((char) => char == ',' ? ',' : '-')
        .join('');

    return Consumer<ShowYourBalanceReducer>(builder: (context, state, child) {
      return Text.rich(TextSpan(
        text: state.isShowYourBalance
            ? moneyFormat.money
            : '${R.strings.currencyType} $moneyHideText',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
        children: [
          TextSpan(
            text: state.isShowYourBalance ? moneyFormat.cents : centHideText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: SurfaceColors.pureWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
          ),
        ],
      ));
    });
  }
}
