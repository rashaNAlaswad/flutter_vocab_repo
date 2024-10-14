import 'package:flutter/material.dart';
import '../../../../model/word.dart';

class CustomeListTile extends StatelessWidget {
  const CustomeListTile(
      {super.key,
      required this.word,
      required this.text,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.onPresse});

  final Word word;
  final IconData leadingIcon;
  final String text;
  final IconData trailingIcon;
  final Function() onPresse;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(word.colorCode),
      ),
      child: ListTile(
        leading: Icon(leadingIcon, color: Colors.white),
        title: Text(text,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        trailing: IconButton(
          onPressed: onPresse,
          icon: Icon(
            trailingIcon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
