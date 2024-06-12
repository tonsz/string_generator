import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

/// A class for error handling in various situations
class ErrorHandler {
  /// Returns a string that represents the error message
  ///
  /// This method takes an [error] parameter as the caught exception.
  String getErrorMessage(error) {
    if (error is SocketException) {
      return 'No internet connection';
    } else if (error is HttpException) {
      return 'An HTTP error occurred';
    } else if (error is FormatException) {
      return 'Invalid format';
    } else if (error is TimeoutException) {
      return 'Request timedout';
    } else {
      return error.toString();
    }
  }

  /// Processes an HTTP [response] and throws an Exception based on the status code.
  ///
  /// This method is used when the HTTP response is not 200 (OK).
  getHttpError(http.Response response) {
    String httpErrorMessage;
    switch (response.statusCode) {
      case 400:
        httpErrorMessage = 'Error 400: Bad request';
      case 401:
        httpErrorMessage = 'Error 401: Unauthorized';
      case 403:
        httpErrorMessage = 'Error 403: Forbidden';
      case 404:
        httpErrorMessage = 'Error 404: Not Found';
      case 500:
        httpErrorMessage = 'Error 500: Internal server error';
      default:
        httpErrorMessage = 'Error: ${response.statusCode}: An error occured.';
    }
    throw httpErrorMessage;
  }
}
