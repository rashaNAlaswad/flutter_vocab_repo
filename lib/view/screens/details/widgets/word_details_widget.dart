import 'package:flutter/material.dart';
import 'custome_list_tile.dart';
import 'edit_bottom_sheet.dart';
import '../../../../model/word.dart';
import 'title_widget.dart';

import 'example_list.dart';

class WordDetailsWidget extends StatelessWidget {
  const WordDetailsWidget({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleWidget(
            title: 'Word',
          ),
          const SizedBox(height: 16),
          CustomeListTile(
            word: word,
            leadingIcon: Icons.flag,
            text: word.word,
            trailingIcon: Icons.edit,
            onPresse: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) => Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: EditBottomSheet(
                          word: word,
                          index: word.id,
                        ),
                      ));
            },
          ),
          const SizedBox(height: 16),
          const TitleWidget(
            title: 'Examples',
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ExampleList(word: word),
          )
        ],
      ),
    );
  }
}
