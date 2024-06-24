import 'package:projectzeta/data/entities/entities.dart';

sealed class OnboardingEntity {
  final UserEntity user;

  OnboardingEntity({required this.user});
}

class OnboardingEntityNotFindUser implements OnboardingEntity {
  final bool showOnboarding = false;

  @override
  get user => UserEntityEmpty();
}

class OnboardingEntityUserExists implements OnboardingEntity {
  final bool showOnboarding;
  @override
  final UserEntity user;

  OnboardingEntityUserExists({
    required this.user,
    required this.showOnboarding,
  });
}

class OnboardingEntitySaveUser implements OnboardingEntity {
  final bool showOnboarding = true;
  @override
  final UserEntity user;

  OnboardingEntitySaveUser({
    required this.user,
  });
}
