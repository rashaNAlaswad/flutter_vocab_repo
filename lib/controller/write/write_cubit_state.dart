abstract class WriteCubitState {}

class WriteIntialState extends WriteCubitState {}

class WriteLoadingState extends WriteCubitState {}

class WriteSuccessState extends WriteCubitState {}

class WriteFailedState extends WriteCubitState {
  final String message;

  WriteFailedState({required this.message});
}
