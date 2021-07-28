class AppException implements Exception {
  final _message;
  final _prefix;

  /// init
  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

/// FetchDataException
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

/// BadRequestException
class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

/// UnauthorisedException
class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

/// InvalidInputException
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
