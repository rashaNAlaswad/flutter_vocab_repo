import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/read/read_cubit.dart';
import '../../../../controller/read/read_cubit_state.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/failure_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import 'word_list.dart';


class WordsWidget extends StatelessWidget {
  const WordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadCubit, ReadCubitState>(
      builder: (context, state) {
        if (state is ReadSuccessState) {
          if (state.words.isEmpty) {
            return const EmptyWidget();
          }
          return WordListWidget(words: state.words);
        } else if (state is ReadFailedState) {
          return FailureWidget(message: state.message);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}