class SuraModel {
  final int id;
  final String name;
  final String englishName;
  final int versCount;

  SuraModel({
    required this.id,
    required this.name,
    required this.englishName,
    required this.versCount,
  });

  factory SuraModel.fromJson(Map<String, dynamic> json) {
    return SuraModel(
      id: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      versCount: json['numberOfAyahs'],
    );
  }
}


