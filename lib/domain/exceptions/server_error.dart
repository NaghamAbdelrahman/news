class ServerError implements Exception {
  String errorMessage;
  String code;

  ServerError(this.errorMessage, this.code);
}
