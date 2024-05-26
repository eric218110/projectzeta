import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentantion/components/icons/icons.dart';
import 'package:projectzeta/src/presentantion/theme/colors.dart';
import 'package:projectzeta/src/presentantion/theme/dimensions.dart';

class YourBalance extends StatelessWidget {
  const YourBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.horizontalPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Seu saldo',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: SurfaceColors.lightGray),
              ),
              ProjectZetaIcons.eyeOffOutline(
                color: SurfaceColors.lightGray,
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              text: 'R\$ 1000',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: SurfaceColors.pureWhite,
                    fontSize: 32,
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
    );
  }
}
