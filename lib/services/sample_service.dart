import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:string_generator/common/error_handler.dart';
import 'package:string_generator/models/sample_model.dart';

final ErrorHandler _errorHandler = ErrorHandler();

class SampleService {
  Future<Sample> getRandomString() async {
    try {
      final response = await http.get(Uri.parse(
          'https://o7q6ka26qs232rmbtpbrxghy6u0vyrup.lambda-url.ap-southeast-1.on.aws/'));

      if (response.statusCode == 200) {
        return Sample.fromJson(jsonDecode(response.body));
      } else {
        return _errorHandler.getHttpError(response);
      }
    } catch (e) {
      throw _errorHandler.getErrorMessage(e);
    }
  }
}
