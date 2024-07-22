import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/balance/render_icons.dart';
import 'package:projectzeta/presentation/components/balance/render_span.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class YourBalance extends StatelessWidget {
  final double balance;

  const YourBalance({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowYourBalanceReducer>(
      builder: (context, state, child) {
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
                        text: R.strings.yourBalance,
                        color: SurfaceColors.lightGray,
                      ),
                      const SizedBox(
                        width: DimensionApplication.base,
                      ),
                      const RenderIcons()
                    ],
                  ),
                  RenderSpan(balance: balance)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
