import 'package:projectzeta/domain/domain.dart';

sealed class UserEntity {
  final String id;
  final String name;
  final String email;
  final String token;
  final List<String> roles;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.roles,
  });
}

class UserEntityWithId extends UserEntity {
  UserEntityWithId(String id)
      : super(email: '', name: '', id: id, token: '', roles: []);
}

class UserEntityEmpty extends UserEntity {
  UserEntityEmpty() : super(email: '', name: '', id: '', token: '', roles: []);
}

class UserEntityByUserModel implements UserEntity {
  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String token;
  @override
  final List<String> roles;

  UserEntityByUserModel._init({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.roles,
  });

  factory UserEntityByUserModel.create(UserModel userModel) {
    return UserEntityByUserModel._init(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      token: userModel.token,
      roles: userModel.roles,
    );
  }

  factory UserEntityByUserModel.fromStringList(List<String> stringList) {
    return UserEntityByUserModel._init(
      id: stringList[0],
      email: stringList[1],
      name: stringList[2],
      token: stringList[3],
      roles: stringList[4].split(';'),
    );
  }
  List<String> toStringList() {
    return [id, email, name, token, roles.join(";")];
  }
}
