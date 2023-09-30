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
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Text(btnTxt ?? "",
              style:  TextStyle(
                color: Color(0xFF197D47),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,
              ),)),
    );
  }
}
