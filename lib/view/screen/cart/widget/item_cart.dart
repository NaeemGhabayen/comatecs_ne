import 'package:flutter/material.dart';

import '../../../base/card_counter.dart';

class ItemCart extends StatefulWidget {
  const ItemCart({key});

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.only(bottom: 16),
      height: 82,
      padding:const EdgeInsets.all(16),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 12),
                  width: MediaQuery.of(context).size.width * .13,
                  child: Image.asset(
                    'assets/images/img_1.png',
                    fit: BoxFit.fill,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'الاسم التجاري الشائع',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 13,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
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
                ],
              ),
            ],
          ),
          CardCounter(),
        ],
      ),
    );
  }
}
