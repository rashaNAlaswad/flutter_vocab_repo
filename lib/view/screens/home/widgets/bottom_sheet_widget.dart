import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../controller/read/read_cubit.dart';
import '../../../../controller/write/write_cubit_state.dart';

import '../../../../controller/write/write_cubit.dart';
import '../../../../core/widgets/colors_widget.dart';
import '../../../../core/widgets/add_button.dart';
import '../../../../core/widgets/custome_form.dart';
import '../../../../core/widgets/error_alert_dialog.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WriteCubit, WriteCubitState>(
      listener: (context, state) {
        if (state is WriteSuccessState) {
          context.pop();
        } else if (state is WriteFailedState) {
          newMethod(context, state);
        }
      },
      builder: (context, state) {
        return _buildBottomSheet(context);
      },
    );
  }

  void newMethod(BuildContext context, WriteFailedState state) {
        showDialog(
      context: context,
      builder: (BuildContext context) {
        return ErrorAlertDialog(
          message: state.message,
        );
      },
    );
  }

  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  Widget _buildBottomSheet(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(WriteCubit.get(context).colorCode),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            CustomForm(
              formKey: formKey,
              label: 'Enter Your Word',
            ),
            const SizedBox(height: 30),
            ColorsWidget(
              selectedColor: WriteCubit.get(context).colorCode,
            ),
            const SizedBox(height: 30),
            AddButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  WriteCubit.get(context).addWord();
                  ReadCubit.get(context).getWords();
                }
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
