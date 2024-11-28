import 'package:flutter/material.dart';

import '../../utill/dimensions.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? btnTxt;
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;
  final bool? isLoading;
  const CustomButton(
      {Key? key, this.onTap,
      @required this.btnTxt,
      this.backgroundColor,
      this.radius = 8,
        this.isLoading=false,
      this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onTap == null
          ? Theme.of(context).primaryColor
          : backgroundColor ?? Theme.of(context).primaryColor,
      minimumSize: Size(MediaQuery.of(context).size.width, 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),
    );
    return TextButton(
        onPressed: onTap,
        style: flatButtonStyle,
        child: isLoading!? const Center(child: SizedBox(width: 20,height: 20,child: CircularProgressIndicator(color: Colors.white,)),):Text(btnTxt ?? "",
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: Dimensions.FONT_SIZE_LARGE,
                fontFamily: "ArbFONTS")));
  }
}
