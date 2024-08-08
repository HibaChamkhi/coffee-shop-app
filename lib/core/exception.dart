class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class UnknownException implements Exception {
  final String message;

  UnknownException({required this.message});
}
