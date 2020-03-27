class ApiException implements Exception {
  String msg;
  dynamic data;

  ApiException({this.msg, this.data});

  String errorMessage() {
    return '${msg} - ${data}';
  }
}
