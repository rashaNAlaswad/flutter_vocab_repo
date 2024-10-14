import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String word;
  @HiveField(2)
  final int colorCode;
  @HiveField(3)
  final List<String> englishExamples;

  Word({
    required this.id,
    required this.word,
    required this.colorCode,
    this.englishExamples = const [],
  });

  Word copyWith({
    int? id,
    String? word,
    int? colorCode,
    List<String>? englishExamples,
  }) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        colorCode: colorCode ?? this.colorCode,
        englishExamples: englishExamples ?? this.englishExamples,
      );

  Word decrementIdByOne() => copyWith(id: id - 1);

  Word addExample(String example) {
    final newExamples = [...englishExamples, example];

    return copyWith(
      englishExamples: newExamples,
    );
  }
}

// flutter packages pub run build_runner build --delete-conflicting-outputs
