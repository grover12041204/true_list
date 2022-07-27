class something{
  final String variable;

  something({
    required this.variable,
  });
  factory something.fromJson(Map<String, dynamic> json) {
    var obj = json['MyAds'];
    return something(
      variable: json['variable'],
    );
  }

}