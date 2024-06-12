import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:string_generator/models/sample_model.dart';
import 'package:string_generator/services/sample_service.dart';

/// This file is a layer that binds the Sample service with a provider
///
/// An instance of [SampleService],
/// the given [url] endpoint,
/// and the [FutureProvider] are declared to share data across the application.
final SampleService _sampleService = SampleService();
String url =
    'https://o7q6ka26qs232rmbtpbrxghy6u0vyrup.lambda-url.ap-southeast-1.on.aws/';

final sampleProvider = FutureProvider<Sample>((ref) async {
  return await _sampleService.getRandomString(url);
});
