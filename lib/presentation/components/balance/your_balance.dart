import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/icons/icons.dart';
import 'package:projectzeta/presentation/components/text/text.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class YourBalance extends StatelessWidget {
  final double balance;

  const YourBalance({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final reducer = ShowYourBalanceReducer();
    final formatBalance = getIt<FormatBalance>();

    final MoneyFormatModel moneyFormat =
        formatBalance.onFormatByDouble(balance);

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
              stepWidth: MediaQuery.of(context).size.width / 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(context: context).regular(
                        text: 'Seu saldo',
                        color: SurfaceColors.lightGray,
                      ),
                      const SizedBox(
                        width: DimensionApplication.base,
                      ),
                      _renderIcons(
                        isShowYourBalance: reducer.state.isShowYourBalance,
                        toggleYourBalance: reducer.toggleYourBalance,
                      ),
                    ],
                  ),
                  Text.rich(
                    _renderText(
                      context: context,
                      moneyFormatModel: moneyFormat,
                      showText: reducer.state.isShowYourBalance,
                    ),
                    softWrap: false,
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
    required MoneyFormatModel moneyFormatModel,
    required bool showText,
    required BuildContext context,
  }) {
    String moneyHideText = moneyFormatModel.money
        .replaceAll('R\$', '')
        .split('')
        .map((char) => char == ' ' ? ' ' : '-')
        .join('');

    String centHideText = moneyFormatModel.cents
        .split('')
        .map((char) => char == ',' ? ',' : '-')
        .join('');

    return TextSpan(
      text: showText ? moneyFormatModel.money : 'R\$ $moneyHideText',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: SurfaceColors.pureWhite,
            fontSize: 36,
            fontWeight: FontWeight.w900,
          ),
      children: [
        TextSpan(
          text: showText ? moneyFormatModel.cents : centHideText,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: SurfaceColors.pureWhite,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }
}
