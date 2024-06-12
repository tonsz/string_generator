class Sample {
  String randomString;

  Sample({
    required this.randomString,
  });

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      randomString: json['randomString'] ?? '',
    );
  }
}
