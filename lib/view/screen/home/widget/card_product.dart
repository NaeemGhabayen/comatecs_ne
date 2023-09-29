import 'package:comatecs/utill/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../product_details/product_details_screen.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({key});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {

bool isFavorite=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0x7FE1E1E1)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: (){
              AppNavigation.navigateTo(context,const ProductDetailsScreen());
            },
            child: Column(
              children: [
                SizedBox(height: 20,),
                Image.asset('assets/images/img_1.png' , height: 100, fit: BoxFit.contain,),
                SizedBox(height: 16,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'الاسم التجاري الشائع',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '16.000 JOD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF197D47),
                        fontSize: 13,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      padding: EdgeInsets.all(3),
                      decoration: ShapeDecoration(
                        color: Color(0xFF197D47),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.50, color: Color(0x7FE1E1E1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SvgPicture.asset(Images.add_cart),
                    )

                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: (){
                isFavorite = !isFavorite;
                setState(() {});
              },
              child: Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Color(0x66F1F1F1),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.25, color: Color(0x66F1F1F1)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: SvgPicture.asset(isFavorite ? Images.Heart_use : Images.Heart ,width: 20,height: 20,
                      color: isFavorite ? ColorResources.RED : Colors.black54)),
            ),
          ),
        ],
      ),
    );
  }
}
