import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:string_generator/models/sample_model.dart';
import 'package:string_generator/services/sample_service.dart';

final SampleService _sampleService = SampleService();

final sampleProvider = FutureProvider<Sample>((ref) async {
  return await _sampleService.getRandomString();
});
