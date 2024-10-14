import 'package:flutter/material.dart';
import '../../../../model/word.dart';
import 'word_item.dart';

class WordListWidget extends StatelessWidget {
  const WordListWidget({
    super.key,
    required this.words,
  });

  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: words.length,
      itemBuilder: (context, index) {
        return WordItem(word: words[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.6,
      ),
    );
  }
}
