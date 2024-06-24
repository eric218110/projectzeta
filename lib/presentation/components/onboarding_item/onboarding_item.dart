import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/text/custom_text.dart';
import 'package:projectzeta/presentation/models/onboarding_items.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingItemsModel onboardingItem;

  const OnboardingItem({
    super.key,
    required this.onboardingItem,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Positioned.fill(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            onboardingItem.child,
            const SizedBox(
              height: DimensionApplication.extraExtraExtraLarge,
            ),
            CustomText(context: context).h4(
              text: onboardingItem.title,
              color: PrimaryColors.deepPurple,
            ),
            const SizedBox(height: DimensionApplication.medium),
            SizedBox(
              width: width * 0.85,
              child: CustomText(context: context).regular(
                text: onboardingItem.description,
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: DimensionApplication.extraExtraExtraLarge,
            ),
          ],
        ),
      ),
    );
  }
}
