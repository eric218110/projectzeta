import 'package:projectzeta/domain/validator/validator.dart';
import 'package:projectzeta/domain/value_object/default_value_object.dart';

class Email implements ValueObject {
  final EmailValidator emailValidator;

  final String _value;

  Email(
    this._value,
    this.emailValidator,
  );

  @override
  String? validator(Object? email) => emailValidator.onValidateEmail(_value);

  @override
  String toString() => _value;
}
