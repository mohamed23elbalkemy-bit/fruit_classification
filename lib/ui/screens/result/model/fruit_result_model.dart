class FruitResult {
  final List<String> imagePaths;
  final String name;
  final String grade;
  final double accuracy;
  final DateTime dateTime;

  FruitResult({
    required this.imagePaths,
    required this.name,
    required this.grade,
    required this.accuracy,
    required this.dateTime,
  });
  Map<String, dynamic> toJson() {
    return {
      'imagePaths': imagePaths,
      'name': name,
      'grade': grade,
      'accuracy': accuracy,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory FruitResult.fromJson(Map<String, dynamic> json) {
    return FruitResult(
      imagePaths: List<String>.from(json['imagePaths']),
      name: json['name'],
      grade: json['grade'],
      accuracy: json['accuracy'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}
