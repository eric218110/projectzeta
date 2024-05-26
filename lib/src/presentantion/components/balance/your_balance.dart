import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentantion/components/icons/icons.dart';
import 'package:projectzeta/src/presentantion/components/text/text.dart';
import 'package:projectzeta/src/presentantion/theme/colors.dart';
import 'package:projectzeta/src/presentantion/theme/dimensions.dart';

class YourBalance extends StatelessWidget {
  final double balance;

  const YourBalance({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
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
                  ProjectZetaIcons.eyeOffOutline(
                    color: SurfaceColors.lightGray,
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: 'R\$ 1 000',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: SurfaceColors.pureWhite,
                        fontSize: 36,
                      ),
                  children: [
                    TextSpan(
                      text: ',00',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: SurfaceColors.pureWhite,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showBalance(BuildContext context) {}
}
