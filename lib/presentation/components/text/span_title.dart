import 'package:flutter/material.dart';
import 'package:projectzeta/domain/use_cases/format/format.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/utils/utils.dart';

class MoneyText extends StatelessWidget {
  final bool show;
  final double value;

  const MoneyText({
    super.key,
    required this.show,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final formatBalance = getIt<FormatBalance>();
    final moneyFormat = formatBalance.onFormatByDouble(0);

    String moneyHideText = moneyFormat.money
        .replaceAll(R.strings.currencyType, '')
        .split('')
        .map((char) => char == ' ' ? ' ' : '-')
        .join('');

    String centHideText = moneyFormat.cents
        .split('')
        .map((char) => char == ',' ? ',' : '-')
        .join('');

    return Text.rich(
      TextSpan(
        text: show
            ? moneyFormat.money
            : '${R.strings.currencyType} $moneyHideText',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
        children: [
          TextSpan(
            text: show ? moneyFormat.cents : centHideText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: SurfaceColors.pureWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
          ),
        ],
      ),
    );
  }
}
