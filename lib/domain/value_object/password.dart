import 'package:projectzeta/domain/value_object/default_value_object.dart';
import 'package:projectzeta/utils/utils.dart';

class Password implements ValueObject {
  final String _value;

  Password(
    this._value,
  );

  @override
  String? validator([Object? password]) {
    if (_value.isEmpty) {
      return R.strings.fieldPasswordIsEmpty;
    }

    return null;
  }

  @override
  String toString() => _value;
}
