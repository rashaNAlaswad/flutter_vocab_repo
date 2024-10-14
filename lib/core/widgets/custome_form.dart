import 'package:flutter/material.dart';
import '../../controller/write/write_cubit.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.formKey, required this.label});

  final GlobalKey<FormState> formKey;
  final String label;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        autofocus: true,
        controller: _textEditingController,
        minLines: 1,
        maxLines: 3,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: _getInputDecoration(),
        onChanged: (value) {
          WriteCubit.get(context).updateText(value);
        },
        validator: (value) {
          return _validator(
            value,
          );
        },
      ),
    );
  }

  String? _validator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "This field is required";
    }
    return null;
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      label: Text(
        widget.label,
        style: const TextStyle(color: Colors.white),
      ),
      enabledBorder: buildBorder(),
      focusedBorder: buildBorder(),
      errorBorder: buildBorder(Colors.red),
      focusedErrorBorder: buildBorder(Colors.red),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white, width: 1),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }
}
