import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/buttons/button_with_icon.dart';
import 'package:projectzeta/presentation/components/icons/icons.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:routefly/routefly.dart';

class ReceiveAndExpenseButton extends StatelessWidget {
  const ReceiveAndExpenseButton({super.key});

  void handlerOnPressGoToRegisterExpense() {
    Routefly.push(routePaths.expense.register);
  }

  @override
  Widget build(BuildContext context) {
    var buttonReceiveStyle = _buttonStyle(context, false);
    var buttonExpenseStyle = _buttonStyle(context, true);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWithIcon(
            title: R.strings.receive,
            iconLeft: ProjectZetaIcons.moneyReceive(),
            style: buttonReceiveStyle,
            onPressed: handlerOnPressGoToRegisterExpense,
          ),
          ButtonWithIcon(
            title: R.strings.expense,
            iconLeft: ProjectZetaIcons.moneySend(),
            style: buttonExpenseStyle,
          )
        ],
      ),
    );
  }

  ButtonStyle _buttonStyle(BuildContext context, bool isExpense) {
    double size = MediaQuery.of(context).size.width * 0.5 -
        DimensionApplication.horizontalPadding -
        DimensionApplication.base;
    Color color = isExpense ? AccentColors.boldRed : AccentColors.vividGreen;

    return TextButton.styleFrom(
      side: BorderSide(
        color: color,
        width: 0.5,
      ),
      foregroundColor: color,
      backgroundColor: GradientColors.translucentGray,
      minimumSize: Size(size, 52),
      shape: BorderRadiusApplication.md,
      padding: const EdgeInsets.symmetric(
        vertical: DimensionApplication.mediumLarge,
        horizontal: DimensionApplication.extraLarge,
      ),
    );
  }
}
