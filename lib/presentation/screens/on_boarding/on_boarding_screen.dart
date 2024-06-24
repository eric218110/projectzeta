import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/save_onboarding.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/dashed_steps/dashed_steps.dart';
import 'package:projectzeta/presentation/models/models.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:routefly/routefly.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnboardingItemsModel> onboardingItems = [];
  late OnboardingItemsModel onboardingActive;
  final onLoadOnboarding = getIt<OnSaveOnboarding>();

  @override
  void initState() {
    setState(() {
      onboardingItems = _makeListItems();
      onboardingActive = onboardingItems[0];
    });
    super.initState();
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
              Positioned(
                bottom: DimensionApplication.smallGigantic,
                child: DashedSteps(
                  amountSteps: 3,
                  onPressNextItem: _onPressInNextItem,
                  onPressBackItem: _onPressInBackItem,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPressInNextItem(int nextActiveIndex) {
    if (nextActiveIndex <= onboardingItems.length - 1 && nextActiveIndex > 0) {
      setState(() {
        onboardingActive = onboardingItems[nextActiveIndex];
      });
    }
    if (nextActiveIndex == onboardingItems.length) {
      Routefly.navigate(routePaths.login);
      onLoadOnboarding.save(UserModelIsEmpty());
    }
  }

  void _onPressInBackItem(int nextActiveIndex) {
    if (nextActiveIndex <= onboardingItems.length - 1 && nextActiveIndex >= 0) {
      setState(() {
        onboardingActive = onboardingItems[nextActiveIndex - 1];
      });
    }
  }

  List<OnboardingItemsModel> _makeListItems() {
    List<OnboardingItemsModel> onboardingList = [];

    onboardingList.add(
      OnboardingItemsModel(
        R.strings.onBoardingScreenOneTitle,
        R.strings.onBoardingScreenOneDescription,
        ProjectZetaIcons.onBoardingScreenOne(),
      ),
    );
    onboardingList.add(
      OnboardingItemsModel(
        R.strings.onBoardingScreenTwoTitle,
        R.strings.onBoardingScreenTwoDescription,
        ProjectZetaIcons.onBoardingScreenTwo(),
      ),
    );

    return onboardingList;
  }
}
