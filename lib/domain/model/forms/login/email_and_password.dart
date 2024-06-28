import 'package:projectzeta/data/provider/validator/email/email_validator.dart';
import 'package:projectzeta/domain/value_object/password.dart';
import 'package:projectzeta/domain/value_object/value_object.dart';
import 'package:projectzeta/main/di/di.dart';

class EmailAndPassword {
  final Email email;
  final Password password;

  EmailAndPassword({
    required this.email,
    required this.password,
  });

  EmailAndPassword fromJSON(dynamic data) {
    EmailValidator emailValidator = getIt.get<EmailValidator>();

    return EmailAndPassword(
      email: Email(data['email'], emailValidator),
      password: Password(data['password']),
    );
  }
}
