import 'package:projectzeta/data/provider/validator/validator.dart';
import 'package:projectzeta/domain/validator/validator.dart';
import 'package:projectzeta/utils/utils.dart';

class ValidatorService implements EmailValidator {
  final ValidatorProvider validatorProvider;

  ValidatorService({required this.validatorProvider});

  @override
  String? onValidateEmail(String email) {
    if (email.isEmpty) {
      return R.strings.fieldEmailIsEmpty;
    }

    if (!validatorProvider.onValidateEmail(email)) {
      return R.strings.fieldEmailIsInvalid;
    }

    return null;
  }
}
