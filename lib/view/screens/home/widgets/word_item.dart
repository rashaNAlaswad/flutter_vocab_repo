import 'package:flutter/material.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../controller/read/read_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../model/word.dart';

class WordItem extends StatelessWidget {
  const WordItem({
    super.key,
    required this.word,
  });

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: InkWell(
        onTap: () => context
            .pushNamed(
              Routes.details,
              arguments: word,
            )
            .then(
              (value) => Future.delayed(
                const Duration(milliseconds: 200),
              ),
            )
            .then((value) => ReadCubit.get(context).getWords()),
        child: Card(
          margin: const EdgeInsets.fromLTRB(10, 0, 8, 0),
          color: Color(word.colorCode),
          child: Center(
            child: Text(
              word.word,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
