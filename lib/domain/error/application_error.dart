class ApplicationError {
  final String message;
  final String? details;

  ApplicationError({
    required this.message,
    this.details,
  });
}
