import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';
import '../../utill/dimensions.dart';

class CustomButtonOutline extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final Color backgroundColor;
  final Color textColor;
  final double radius;

  CustomButtonOutline(
      {this.onTap,
      @required this.btnTxt,
      this.backgroundColor,
      this.radius = 8,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Text(btnTxt ?? "",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                fontWeight: FontWeight.w500
                 ))),
    );
  }
}
