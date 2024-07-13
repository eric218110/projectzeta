enum Paths {
  cardShow,
  authLogin;

  String get value {
    switch (this) {
      case Paths.cardShow:
        return 'http://localhost:8080/cards/show';
      case Paths.authLogin:
        return 'http://localhost:8080/auth/login';
    }
  }
}
