import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:string_generator/models/sample_model.dart';

class SampleService {
  Future<Sample> getRandomString() async {
    final response = await http.get(Uri.parse(
        'https://o7q6ka26qs232rmbtpbrxghy6u0vyrup.lambda-url.ap-southeast-1.on.aws/'));

    if (response.statusCode == 200) {
      return Sample.fromJson(jsonDecode(response.body)); // revise this later
    } else {
      throw Exception('Failed getting response.');
    }
  }
}
