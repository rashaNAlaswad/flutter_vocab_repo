import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/extensions.dart';
import '../../../controller/read/read_cubit.dart';
import '../../../controller/write/write_cubit.dart';
import '../../../core/widgets/fab_widget.dart';
import '../../../core/widgets/failure_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../controller/read/read_cubit_state.dart';
import '../../../model/word.dart';
import 'widgets/add_example_bottom_sheet.dart';
import 'widgets/word_details_widget.dart';

class WordDetailsScreen extends StatefulWidget {
  const WordDetailsScreen({super.key, required this.word});

  final Word word;

  @override
  State<WordDetailsScreen> createState() => _WordDetailsScreenState();
}

late Word _word;

class _WordDetailsScreenState extends State<WordDetailsScreen> {
  @override
  void initState() {
    super.initState();
    _word = widget.word;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: BlocBuilder<ReadCubit, ReadCubitState>(
        builder: (context, state) {
          if (state is ReadSuccessState) {
            int index =
                state.words.indexWhere((element) => element.id == _word.id);
            if (widget.word.id == -1) {
              return const FailureWidget(message: 'Word not found');
            }
            _word = state.words[index];
            return WordDetailsWidget(word: _word);
          } else if (state is ReadFailedState) {
            return FailureWidget(message: state.message);
          } else {
            return const LoadingWidget();
          }
        },
      ),
      floatingActionButton: FABWidget(
        bottomSheet: AddExampleBottomSheet(
          index: _word.id,
          word: _word,
        ),
      ),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      title: const Text('Word Details',
          style: TextStyle(color: Colors.black, fontSize: 20)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            WriteCubit.get(context).deleteWord(widget.word.id);
            context.pop();
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
