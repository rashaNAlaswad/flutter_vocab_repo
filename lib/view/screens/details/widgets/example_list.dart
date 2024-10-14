import 'package:flutter/material.dart';
import 'custome_list_tile.dart';
import '../../../../controller/read/read_cubit.dart';
import '../../../../model/word.dart';

class ExampleList extends StatelessWidget {
  const ExampleList({
    super.key,
    required this.word,
  });

  final Word word;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return CustomeListTile(
            word: word,
            leadingIcon: Icons.numbers,
            text: word.englishExamples[index],
            trailingIcon: Icons.remove_circle_outline,
            onPresse: () {
              word.englishExamples.removeAt(index);
              ReadCubit.get(context).getWords();
            },
          )              ;
        },
        itemCount: word.englishExamples.length,
        shrinkWrap: true);
  }
}
