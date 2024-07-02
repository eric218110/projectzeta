import 'package:projectzeta/data/provider/validator/validator.dart';
import 'package:string_validator/string_validator.dart';

class StringValidator implements ValidatorProvider {
  @override
  bool onValidateEmail(String email) {
    return isEmail(email);
  }
}
