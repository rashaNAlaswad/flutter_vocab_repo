import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, this.onPressed});

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: const Size.fromHeight(50),
      ),
      child: const Text('Add New Word'),
    );
  }
}
