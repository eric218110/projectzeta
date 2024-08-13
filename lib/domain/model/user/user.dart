import 'package:projectzeta/data/entities/user/user.dart';

sealed class UserModel {
  final String id;
  final String name;
  final String email;
  final String token;
  final List<String> roles;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.roles,
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

  @override
  List<String> get roles => [""];
}

class UserModelNoEmpty implements UserModel {
  @override
  final String email;

  @override
  final String id;

  @override
  final String name;

  @override
  final String token;

  @override
  final List<String> roles;

  UserModelNoEmpty({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
    required this.roles,
  });

  factory UserModelNoEmpty.byUserEntity({required UserEntity userEntity}) {
    return UserModelNoEmpty(
      id: userEntity.id,
      email: userEntity.email,
      name: userEntity.name,
      token: userEntity.token,
      roles: userEntity.roles,
    );
  }

  factory UserModelNoEmpty.fromJSON({required Map<String, dynamic> json}) {
    return UserModelNoEmpty(
      id: json['uuid'] ?? '',
      email: json['userName'] ?? '',
      name: json['name'] ?? '',
      token: json['accessToken'] ?? '',
      roles: List<String>.from(json['roles'] ?? []),
    );
  }
}
