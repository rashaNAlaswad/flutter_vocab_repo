import '../../model/word.dart';

abstract class ReadCubitState {}

class ReadIntialState extends ReadCubitState {}

class ReadLoadingState extends ReadCubitState {}

class ReadSuccessState extends ReadCubitState {
  final List<Word> words;
  ReadSuccessState({required this.words});
}

class ReadFailedState extends ReadCubitState {
  final String message;
  ReadFailedState({required this.message});
}