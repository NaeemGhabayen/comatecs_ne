import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utill/dimensions.dart';
import '../../utill/images.dart';
import 'custom_button.dart';

class Custom404 extends StatefulWidget {
  final String title;
  final String text;
  final String btnTxt;
  final Function ontap;

  Custom404({this.title, @required this.text, @required this.btnTxt , @required this.ontap });

  @override
  State<Custom404> createState() => _Custom404State();
}

class _Custom404State extends State<Custom404> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center(
          //   child: SvgPicture.asset(
          //     Images.image_404,
          //     height: MediaQuery.of(context).size.height / 3,
          //     fit: BoxFit.scaleDown,
          //     matchTextDirection: true,
          //   ),
          // ),
          Center(
              child: widget.title == null ?const SizedBox(): Text(
                widget.title,
                style:const TextStyle(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    fontWeight: FontWeight.bold),
              )),
          const   SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
          Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: Dimensions.FONT_SIZE_LARGE,),
                ),
              )),
          const  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
          // CustomButton(
          //   onTap: () {
          //     widget.ontap();
          //   },
          //   btnTxt: widget.btnTxt,
          //   backgroundColor: Theme.of(context).primaryColor,
          // ),
        ],
      ),
    );
  }
}
