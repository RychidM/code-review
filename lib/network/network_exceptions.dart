import 'exception_constants.dart';

class CustomException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;

  CustomException([this._message]);

  @override
  String toString() {
    return "$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException(
      [String? message = Exceptions.dioErrorDuringCommunicationMsg])
      : super(message);
}

class BadRequestException extends CustomException {
  BadRequestException([String? message = Exceptions.dioInvalidRequestMsg])
      : super(message);
}

class UnauthorizedException extends CustomException {
  UnauthorizedException([String? message = Exceptions.dioUnauthorizedMsg])
      : super(message);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message = Exceptions.dioInvalidInputMsg])
      : super(message);
}

class InternalServerErrorException extends CustomException {
  InternalServerErrorException([String? message = Exceptions.dioInternatServerExceptionMsg]) : super(message);
}
