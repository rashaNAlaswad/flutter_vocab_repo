import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      backgroundColor: Colors.red,
      contentPadding: const EdgeInsets.all(16),
    );
  }
}
