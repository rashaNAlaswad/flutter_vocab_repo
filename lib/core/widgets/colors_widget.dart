import 'package:flutter/material.dart';

import '../../controller/write/write_cubit.dart';
import '../../core/helpers/colors_helper.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({super.key, required this.selectedColor});

  final int selectedColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: ColorsHelper.colors.length,
        itemBuilder: (context, index) =>
            ColorItem(selectedColor: selectedColor, index: index),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.selectedColor,
    required this.index,
  });

  final int selectedColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          WriteCubit.get(context).updatecolorCode(ColorsHelper.colors[index]),
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(ColorsHelper.colors[index]),
          border: (selectedColor == ColorsHelper.colors[index])
              ? Border.all(color: Colors.white, width: 1)
              : null,
        ),
        child: (selectedColor == ColorsHelper.colors[index])
            ? const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
