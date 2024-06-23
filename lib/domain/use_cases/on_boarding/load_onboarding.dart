import 'package:projectzeta/domain/model/onboarding/onboarding.dart';
import 'package:projectzeta/domain/model/user/user.dart';

abstract class OnLoadOnboarding {
  Future<OnboardingModel> findByUser(UserModel userModel);
}
