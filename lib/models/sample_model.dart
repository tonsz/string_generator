/// A class that represents a sample.
class Sample {
  /// A property that represents the random string.
  String randomString;

  /// Initialization of the Sample class.
  Sample({
    required this.randomString,
  });

  /// Derives an instance of Sample from a JSON object.
  ///
  /// The [json] parameter must have a [randomString] key.
  /// If [randomString] is null, its default value is an empty string.
  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      randomString: json['randomString'] ?? '',
    );
  }
}
