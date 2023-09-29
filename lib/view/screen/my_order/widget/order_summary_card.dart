import 'package:flutter/material.dart';

class OrderSummaryCard extends StatefulWidget {
  const OrderSummaryCard({key});

  @override
  State<OrderSummaryCard> createState() => _OrderSummaryCardState();
}

class _OrderSummaryCardState extends State<OrderSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return    Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side:
          BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ملخص الطلب',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF212121),
              fontSize: 14,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                color: Color(0xFFE1E1E1),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'رمز الطلب',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '#1254631',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF197D47),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تاريخ الطلب',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '20/9/2023',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xB2212121),
                  fontSize: 13,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'حالة السداد  ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'غير مدفوعة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFFE25440),
                  fontSize: 13,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'طريقة الدفع',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'تسليم باليد',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xCC505050),
                  fontSize: 13,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'عنوان الشحن',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'المكان',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xCC505050),
                  fontSize: 13,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
