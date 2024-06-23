sealed class UserModel {
  final String id;
  final String name;
  final String email;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });
}

class UserModelIsEmpty implements UserModel {
  @override
  String get email => '';

  @override
  String get id => '';

  @override
  String get name => '';

  @override
  String get token => '';
}
