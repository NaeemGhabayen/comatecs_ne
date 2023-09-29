import 'package:flutter/material.dart';

import '../../../../utill/images.dart';

class ItemProfile extends StatefulWidget {
  final String title;
  final String icon;
  final Function onPress;

  const ItemProfile({key , this.title, this.onPress,this.icon});

  @override
  State<ItemProfile> createState() => _ItemProfileState();
}

class _ItemProfileState extends State<ItemProfile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 16,left: 20,right: 20),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFE1E1E1)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(widget.icon ,width: 16,height: 16,),
                SizedBox(width: 12,),
                Text(
                widget.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 15,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.center,
                child: Icon(Icons.arrow_forward_ios,size: 16,color: Color.fromRGBO(33, 33, 33, 0.4),)),
          ],
        ),
      ),
    );
  }
}
