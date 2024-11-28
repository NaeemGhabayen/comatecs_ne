import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';

class CustomButtonOutline extends StatelessWidget {
  final VoidCallback? onTap;
  final String? btnTxt;
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;

  const CustomButtonOutline(
      {Key? key, this.onTap,
      @required this.btnTxt,
      this.backgroundColor,
      this.radius = 8,
      this.textColor}) : super(key: key);

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
              style:  const TextStyle(
                color: Color(0xFF197D47),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,
              ),)),
    );
  }
}
