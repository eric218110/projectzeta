import 'package:projectzeta/domain/model/user/user.dart';

sealed class OnboardingModel {
  final UserModel user;
  final bool showOnboarding;

  OnboardingModel(this.user, this.showOnboarding);
}

class OnboardingModelNotExistsUser implements OnboardingModel {
  @override
  final UserModel user = UserModelIsEmpty();
  @override
  final bool showOnboarding = true;

  OnboardingModelNotExistsUser();
}

class OnboardingModelNotShow implements OnboardingModel {
  @override
  final UserModel user = UserModelIsEmpty();
  @override
  final bool showOnboarding = false;

  OnboardingModelNotShow();
}

class OnboardingModelShow implements OnboardingModel {
  @override
  final UserModel user;
  @override
  final bool showOnboarding = true;

  OnboardingModelShow({
    required this.user,
  });
}
