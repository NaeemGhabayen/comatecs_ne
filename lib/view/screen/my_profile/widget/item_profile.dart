import 'package:flutter/material.dart';


class ItemProfile extends StatefulWidget {
  final String? title;
  final String? icon;
  final VoidCallback? onPress;

  const ItemProfile({Key? key , this.title, this.onPress,this.icon}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE1E1E1)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                widget.icon==null?const SizedBox():    Image.asset(widget.icon! ,width: 16,height: 16,),
                widget.icon==null?const SizedBox():      const SizedBox(width: 12,),
                Text(
                widget.title!,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
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
                child: const Icon(Icons.arrow_forward_ios,size: 16,color: Color.fromRGBO(33, 33, 33, 0.4),)),
          ],
        ),
      ),
    );
  }
}
