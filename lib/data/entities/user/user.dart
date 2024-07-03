class UserEntity {
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
