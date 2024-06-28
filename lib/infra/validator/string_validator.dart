import 'package:projectzeta/data/provider/validator/email/email_validator.dart';
import 'package:string_validator/string_validator.dart';

class StringValidator implements EmailValidator {
  @override
  bool onValidateEmail(String email) {
    return isEmail(email);
  }
}
