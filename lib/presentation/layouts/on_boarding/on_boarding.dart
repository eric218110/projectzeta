import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/models/models.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:routefly/routefly.dart';

class OnBoardingLayout extends StatefulWidget {
  final List<OnboardingItemsModel> onboardingItems;
  final Function(OnboardingItemsModel)? onChangeOnboardingActive;

  const OnBoardingLayout({
    super.key,
    this.onChangeOnboardingActive,
    required this.onboardingItems,
  });

  @override
  State<OnBoardingLayout> createState() => _OnBoardingLayoutState();
}

class _OnBoardingLayoutState extends State<OnBoardingLayout> {
  late OnboardingItemsModel onboardingActive;

  _changeOnBoarding(OnboardingItemsModel onboarding) {
    setState(() {
      onboardingActive = onboarding;
    });

    if (widget.onChangeOnboardingActive != null) {
      widget.onChangeOnboardingActive!(onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: DimensionApplication.smallGigantic,
      child: DashedSteps(
        amountSteps: 3,
        onPressNextItem: _onPressInNextItem,
        onPressBackItem: _onPressInBackItem,
      ),
    );
  }

  void _onPressInNextItem(int nextActiveIndex) {
    if (nextActiveIndex <= widget.onboardingItems.length - 1 &&
        nextActiveIndex > 0) {
      _changeOnBoarding(widget.onboardingItems[nextActiveIndex]);
    }
    if (nextActiveIndex == widget.onboardingItems.length) {
      Routefly.navigate(routePaths.login);
    }
  }

  void _onPressInBackItem(int nextActiveIndex) {
    if (nextActiveIndex <= widget.onboardingItems.length - 1 &&
        nextActiveIndex >= 0) {
      _changeOnBoarding(widget.onboardingItems[nextActiveIndex - 1]);
    }
  }
}
