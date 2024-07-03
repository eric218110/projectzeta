import 'package:projectzeta/domain/validator/validator.dart';
import 'package:projectzeta/domain/value_object/password.dart';
import 'package:projectzeta/domain/value_object/value_object.dart';

class EmailAndPassword {
  final EmailValidator emailValidator;
  Email _email;
  Password _password;

  Email get email => _email;
  void setEmail(String? email) => {_email = Email(email ?? '', emailValidator)};

  Password get password => _password;
  void setPassword(String? password) => _password = Password(password ?? '');

  EmailAndPassword(
    this._email,
    this._password,
    this.emailValidator,
  );

  EmailAndPassword fromJSON(dynamic data) => EmailAndPassword(
        Email(data['email'], emailValidator),
        Password(data['password']),
        emailValidator,
      );

  factory EmailAndPassword.empty(EmailValidator emailValidator) =>
      EmailAndPassword(
        Email('', emailValidator),
        Password(''),
        emailValidator,
      );
}
