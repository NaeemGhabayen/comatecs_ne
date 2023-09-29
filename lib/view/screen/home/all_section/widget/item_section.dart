
import 'package:comatecs/utill/navigation.dart';
import 'package:flutter/material.dart';

import '../../../section_details/section_details_screen.dart';

class ItemSection extends StatefulWidget {
  const ItemSection({key});

  @override
  State<ItemSection> createState() => _ItemSectionState();
}

class _ItemSectionState extends State<ItemSection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppNavigation.navigateTo(context, SectionDetailsScreen());
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 16),
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
            Text(
              'الأدوات والمعدات',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xCC212121),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
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
