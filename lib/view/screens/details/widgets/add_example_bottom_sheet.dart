import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/read/read_cubit.dart';
import '../../../../controller/write/write_cubit.dart';
import '../../../../controller/write/write_cubit_state.dart';
import '../../../../core/widgets/add_button.dart';
import '../../../../core/widgets/custome_form.dart';
import '../../../../core/widgets/error_alert_dialog.dart';
import '../../../../model/word.dart';

class AddExampleBottomSheet extends StatefulWidget {
  final int index;
  final Word word;

  const AddExampleBottomSheet(
      {super.key, required this.index, required this.word});

  @override
  State<AddExampleBottomSheet> createState() => _AddExampleBottomSheetState();
}

class _AddExampleBottomSheetState extends State<AddExampleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WriteCubit, WriteCubitState>(
      listener: (context, state) {
        if (state is WriteSuccessState) {
          Navigator.pop(context);
        } else if (state is WriteFailedState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ErrorAlertDialog(
                message: state.message,
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(widget.word.colorCode),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                CustomForm(
                  formKey: formKey,
                  label: 'Enter Example',
                ),
                const SizedBox(height: 30),
                AddButton(onPressed: () {
                  if (formKey.currentState!.validate()) {
                    WriteCubit.get(context).addExample(widget.index);
                    ReadCubit.get(context).getWords();
                  }
                }),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
