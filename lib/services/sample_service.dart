import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:string_generator/common/error_handler.dart';
import 'package:string_generator/models/sample_model.dart';

final ErrorHandler _errorHandler = ErrorHandler();

/// A service class for making API requests.
///
/// The class has methods for handling HTTP responses
/// for fetching data and other CRUD operations.
class SampleService {
  Future<Sample> getRandomString(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

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
