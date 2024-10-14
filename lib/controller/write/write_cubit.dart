import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../model/word.dart';
import '../../core/helpers/constants.dart';
import 'write_cubit_state.dart';

class WriteCubit extends Cubit<WriteCubitState> {
  WriteCubit() : super(WriteIntialState());

  static WriteCubit get(context) => BlocProvider.of(context);

  final Box box = Hive.box(Constants.hiveBoxName);

  String text = '';
  int colorCode = 0xFF255F85;

  void updateText(String value) {
    text = value;
  }

  void updatecolorCode(int value) {
    colorCode = value;
    emit(WriteIntialState());
  }

  void addWord() {
    List<Word> words = [...box.get(Constants.hiveWordKey, defaultValue: [])];
    _tryAndCatchBlock(() {
      words.add(Word(
        id: words.length,
        word: text,
        colorCode: colorCode,
      ));
      box.put(Constants.hiveWordKey, words);
    });
  }

  void deleteWord(int index) {
    List<Word> words = [...box.get(Constants.hiveWordKey, defaultValue: [])];
    _tryAndCatchBlock(() {
      words.removeAt(index);
      for (int i = index; i < words.length; i++) {
        words[i] = words[i].decrementIdByOne();
      }
      box.put(Constants.hiveWordKey, words);
    });
  }

  void editWord(int index) {
    List<Word> words = [...box.get(Constants.hiveWordKey, defaultValue: [])];
    colorCode = words[index].colorCode;
    _tryAndCatchBlock(() {
      words[index] = words[index].copyWith(word: text);
      box.put(Constants.hiveWordKey, words);
    });
  }

  void addExample(int index) {
    List<Word> words = [...box.get(Constants.hiveWordKey, defaultValue: [])];
    _tryAndCatchBlock(() {
      words[index] = words[index].addExample(text);
      box.put(Constants.hiveWordKey, words);
    });
  }

  _tryAndCatchBlock(Function function) {
    emit(WriteLoadingState());
    try {
      function.call();
      emit(WriteSuccessState());
    } catch (error) {
      emit(WriteFailedState(message: 'We have a problem. $error'));
    }
  }
}
