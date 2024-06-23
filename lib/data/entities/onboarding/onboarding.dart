import 'package:projectzeta/domain/model/user/user.dart';

sealed class OnboardingEntity {
  final UserModel user;

  OnboardingEntity({required this.user});
}

class OnboardingEntityNotFindUser implements OnboardingEntity {
  final bool showOnboarding = false;

  @override
  get user => UserModelIsEmpty();
}

class OnboardingEntityUserExists implements OnboardingEntity {
  final bool showOnboarding;
  @override
  final UserModel user;

  OnboardingEntityUserExists({
    required this.user,
    required this.showOnboarding,
  });
}
