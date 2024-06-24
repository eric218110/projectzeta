class UserEntity {
  final String id;
  final String name;
  final String email;
  final String token;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });
}

class UserEntityWithId extends UserEntity {
  UserEntityWithId(String id) : super(email: '', name: '', id: id, token: '');
}

class UserEntityEmpty extends UserEntity {
  UserEntityEmpty() : super(email: '', name: '', id: '', token: '');
}
