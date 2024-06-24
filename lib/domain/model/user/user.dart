import 'package:projectzeta/data/entities/entities.dart';

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

class UserModelNoEmpty implements UserModel {
  @override
  final String email;

  @override
  final String id;

  @override
  final String name;

  @override
  final String token;

  UserModelNoEmpty({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
  });

  factory UserModelNoEmpty.byUserEntity({required UserEntity userEntity}) {
    return UserModelNoEmpty(
      id: userEntity.id,
      email: userEntity.email,
      name: userEntity.name,
      token: userEntity.token,
    );
  }
}
