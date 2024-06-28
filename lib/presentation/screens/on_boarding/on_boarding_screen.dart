import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/builders/on_boarding_item_builder.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/layouts/layout.dart';
import 'package:projectzeta/presentation/models/models.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnboardingItemsModel onboardingActive;
  final onboardingItems = OnBoardingItemBuilder.build();

  @override
  void initState() {
    _onChangeOnboardingActive(onboardingItems[0]);
    super.initState();
  }

  void _onChangeOnboardingActive(OnboardingItemsModel onboarding) {
    setState(() {
      onboardingActive = onboarding;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              const OverlayOnboarding(),
              OnboardingItem(onboardingItem: onboardingActive),
              OnBoardingLayout(
                onChangeOnboardingActive: _onChangeOnboardingActive,
                onboardingItems: onboardingItems,
              )
            ],
          ),
        ),
      ),
    );
  }
}
