import 'package:flutter/material.dart';
import '../../../controller/read/read_cubit.dart';
import '../../../core/widgets/no_result_widget.dart';
import 'widgets/word_list.dart';
import '../../../core/widgets/fab_widget.dart';
import '../../../model/word.dart';
import 'widgets/bottom_sheet_widget.dart';

import 'widgets/words_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: const Text('My Words',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showSearch<Word?>(
                    context: context, delegate: WordSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: WordsWidget()),
        ],
      ),
      floatingActionButton: const FABWidget(
        bottomSheet: BottomSheetWidget(),
      ),
    );
  }
}

class WordSearchDelegate extends SearchDelegate<Word?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SuggestionOrResultWidget(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SuggestionOrResultWidget(query: query);
  }
}

class SuggestionOrResultWidget extends StatelessWidget {
  const SuggestionOrResultWidget({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    List<Word> items = ReadCubit.get(context)
        .words
        .where((element) =>
            element.word.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (items.isEmpty) return const NoResultWidget();
    return WordListWidget(words: items);
  }
}
