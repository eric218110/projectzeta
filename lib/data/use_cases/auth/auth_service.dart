import 'package:projectzeta/data/provider/http/client.dart';
import 'package:projectzeta/domain/domain.dart';

class AuthService implements AuthByEmailAndPassword {
  final HttpClientProvider httpClientProvider;

  AuthService({required this.httpClientProvider});

  @override
  Future<UserModel> onAuth(EmailAndPassword emailAndPassword) async {
    var url = Paths.authLogin.value;
    var body = emailAndPassword.toJSON();

    var response = await httpClientProvider
        .post<Map<String, dynamic>, Map<String, dynamic>>(body, url);

    return UserModelNoEmpty.fromJSON(json: response);
  }
}
