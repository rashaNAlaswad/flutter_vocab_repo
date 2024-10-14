import 'package:flutter/material.dart';

class FABWidget extends StatelessWidget {
  const FABWidget({
    super.key,
    required this.bottomSheet,
  });

  final Widget bottomSheet;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useRootNavigator: true,
            barrierColor: Colors.transparent,
            builder: (BuildContext context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: bottomSheet,
                ));
      },
      child: const Icon(Icons.add),
    );
  }
}
