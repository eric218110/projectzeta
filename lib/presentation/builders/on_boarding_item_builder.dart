import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/models/models.dart';
import 'package:projectzeta/utils/i18n/resources/r.dart';

class OnBoardingItemBuilder {
  static List<OnboardingItemsModel> build() {
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
