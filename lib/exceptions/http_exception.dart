class HttpException implements Exception {
  int status;

  HttpException(this.status);

  @override
  String toString() {
    return "Error : $status";
  }
}
