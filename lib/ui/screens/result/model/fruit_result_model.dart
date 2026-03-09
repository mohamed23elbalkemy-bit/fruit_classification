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
}