import 'package:projectzeta/data/provider/validator/email/email_validator.dart';
import 'package:projectzeta/domain/value_object/default_value_object.dart';
import 'package:projectzeta/utils/utils.dart';

class Email implements ValueObject {
  final EmailValidator emailValidator;

  final String _value;

  Email(
    this._value,
    this.emailValidator,
  );

  @override
  String? validator(Object? email) {
    if (_value.isEmpty) {
      return R.strings.fieldEmailIsEmpty;
    }

    if (!emailValidator.onValidateEmail(_value)) {
      return R.strings.fieldEmailIsInvalid;
    }

    return null;
  }

  @override
  String toString() => _value;
}
