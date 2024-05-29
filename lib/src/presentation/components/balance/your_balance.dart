import 'package:flutter/material.dart';
import 'package:projectzeta/src/domain/domain.dart';
import 'package:projectzeta/src/main/di/di.dart';
import 'package:projectzeta/src/presentation/components/icons/icons.dart';
import 'package:projectzeta/src/presentation/components/text/text.dart';
import 'package:projectzeta/src/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/src/presentation/theme/colors.dart';
import 'package:projectzeta/src/presentation/theme/dimensions.dart';

class YourBalance extends StatelessWidget {
  final double balance;

  const YourBalance({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final reducer = ShowYourBalanceReducer();
    final formatBalance = getIt<FormatBalance>();

    final moneyFormatEntity = formatBalance.onFormatByDouble(balance);

    return ListenableBuilder(
      listenable: reducer,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DimensionApplication.horizontalPadding,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(context: context).regular(
                        text: 'Seu saldo',
                        color: SurfaceColors.lightGray,
                      ),
                      _renderIcons(
                        isShowYourBalance: reducer.state.isShowYourBalance,
                        toggleYourBalance: reducer.toggleYourBalance,
                      ),
                    ],
                  ),
                  RichText(
                    text: _renderText(
                      context: context,
                      showText: reducer.state.isShowYourBalance,
                      moneyFormatEntity: moneyFormatEntity,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _renderIcons({
    required bool isShowYourBalance,
    required Function() toggleYourBalance,
  }) {
    return isShowYourBalance
        ? IconButton(
            onPressed: () {
              toggleYourBalance();
            },
            icon: ProjectZetaIcons.eyeOffOutline(
              color: SurfaceColors.lightGray,
            ))
        : IconButton(
            onPressed: () {
              toggleYourBalance();
            },
            icon: ProjectZetaIcons.eyeOutline(
              color: SurfaceColors.lightGray,
            ),
          );
  }

  TextSpan _renderText({
    required MoneyFormatEntity moneyFormatEntity,
    required bool showText,
    required BuildContext context,
  }) {
    String moneyHideText = moneyFormatEntity.money
        .replaceAll('R\$', '')
        .split('')
        .map((char) => char == ' ' ? ' ' : '-')
        .join('');

    String centHideText = moneyFormatEntity.cents
        .split('')
        .map((char) => char == ',' ? ',' : '-')
        .join('');

    return TextSpan(
      text: showText ? moneyFormatEntity.money : 'R\$ $moneyHideText',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: SurfaceColors.pureWhite,
            fontSize: 36,
          ),
      children: [
        TextSpan(
          text: showText ? moneyFormatEntity.cents : centHideText,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: SurfaceColors.pureWhite,
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
