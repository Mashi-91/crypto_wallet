import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'const_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.title, this.color, this.textColor, this.onTap);
  final String title;
  final Color color;
  final Color textColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: color,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
                color: ConstColors.primaryBlue, width: 1)),
        width: 200,
        height: 46,
        child: title.text.letterSpacing(0.5).color(textColor).size(15).fontWeight(FontWeight.bold).makeCentered(),
      ),
    );
  }
}
