import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:string_generator/models/sample_model.dart';

class SampleService {
  Future<Sample> getRandomString() async {
    try {
      final response = await http.get(Uri.parse(
          'https://o7q6ka26qs232rmbtpbrxghy6u0vyrup.lambda-url.ap-southeast-1.on.aws/'));

      if (response.statusCode == 200) {
        return Sample.fromJson(jsonDecode(response.body));
      } else {
        return _getHttpError(response);
      }
    } catch (e) {
      throw _getErrorMessage(e);
    }
  }
}

_getErrorMessage(error) {
  if (error is SocketException) {
    return error.toString();
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

dynamic _getHttpError(http.Response response) {
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
      httpErrorMessage =
          'An error occured. Status code: ${response.statusCode}';
  }
  throw httpErrorMessage;
}
