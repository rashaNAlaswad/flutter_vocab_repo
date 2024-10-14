import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/helpers/constants.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Constants.noSearchImage, width: 100, height: 200),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'No Result Found',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
