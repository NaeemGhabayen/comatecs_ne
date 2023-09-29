import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';
import '../../utill/dimensions.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final Color backgroundColor;
  final Color textColor;
  final double radius;

  CustomButton(
      {this.onTap,
      @required this.btnTxt,
      this.backgroundColor,
      this.radius = 8,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onTap == null
          ? Theme.of(context).primaryColor
          : backgroundColor == null
              ? Theme.of(context).primaryColor
              : backgroundColor,
      minimumSize: Size(MediaQuery.of(context).size.width, 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
    return TextButton(
        onPressed: onTap,
        style: flatButtonStyle,
        child: Text(btnTxt ?? "",
            style: TextStyle(
                color: textColor == null ? Colors.white : textColor,
                fontSize: Dimensions.FONT_SIZE_LARGE,
                fontFamily: "ArbFONTS")));
  }
}
