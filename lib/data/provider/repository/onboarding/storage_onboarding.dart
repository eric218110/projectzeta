import 'package:projectzeta/data/entities/entities.dart';

abstract class OnboardingRepository {
  Future<OnboardingEntity> findByUserId(String userId);
  Future<bool> onSave(OnboardingEntity onboardingEntity);
}
