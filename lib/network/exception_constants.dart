class Exceptions {
  Exceptions._();

  /*----------- receive and connect timeout -----------*/
  static const int connectTimeout = 20000;
  static const int receiveTimeout = 45000;

  /*----------- Exception -----------*/
  static const String dioErrorDuringCommunicationMsg =
      'Error During Communication';
  static const String dioInvalidRequestMsg = 'Bad Request';
  static const String dioUnauthorizedMsg = 'Unauthorized';
  static const String dioInvalidInputMsg = 'Invalid Input';
  static const String dioNoInternetMsg = 'No internet';
  static const String dioUnableToProcessMsg = 'Unable to process';
  static const String dioConnectionTimeoutMsg = 'Connection Timeout';
  static const String dioReceiveTimeoutMsg = 'Receive Timeout';
  static const String dioCancelRequestMsg = 'Cancel Request';
  static const String dioServerErrorOccurredMsg = 'Server Error Occurred';
  static const String dioErrorOccurredMsg = 'Error Occurred';
  static const String dioNotFoundMsg = 'Not Found';
  static const String dioInternatServerExceptionMsg = 'Internat Server Exception';
}
