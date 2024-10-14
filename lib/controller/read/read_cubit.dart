import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../model/word.dart';
import '../../core/helpers/constants.dart';
import 'read_cubit_state.dart';

class ReadCubit extends Cubit<ReadCubitState> {
  ReadCubit() : super(ReadIntialState());

  static ReadCubit get(context) => BlocProvider.of(context);

  final Box box = Hive.box(Constants.hiveBoxName);

  void getWords() {
    emit(ReadLoadingState());
    try {
      List<Word> words =
          box.get(Constants.hiveWordKey, defaultValue: []).cast<Word>();
      emit(ReadSuccessState(words: words.reversed.toList()));
    } catch (error) {
      emit(ReadFailedState(message: error.toString()));
    }
  }

  List<Word> get words => box
      .get(Constants.hiveWordKey, defaultValue: [])
      .cast<Word>()
      .reversed
      .toList();
}
