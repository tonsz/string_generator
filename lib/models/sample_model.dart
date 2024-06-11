class Sample {
  String? randomString;

  Sample({
    this.randomString,
  });

  factory Sample.fromJson(json) {
    return Sample(
      randomString: json['randomString'],
    );
  }
}
