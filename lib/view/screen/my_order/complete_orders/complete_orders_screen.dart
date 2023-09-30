import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';

class CompleteOrdersScreen extends StatefulWidget {
  const CompleteOrdersScreen({key});

  @override
  State<CompleteOrdersScreen> createState() => _CompleteOrdersScreenState();
}

class _CompleteOrdersScreenState extends State<CompleteOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body:  Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext ctx, index) {
                    return    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '#1254631',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),

                              const Text(
                                '20/9/2023',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xCC212121),
                                  fontSize: 13,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const[
                                  Text(
                                    'حالة السداد - ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xCC212121),
                                      fontSize: 13,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    'مدفوعة',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xB2212121),
                                      fontSize: 13,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                '16.000',
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
                          SizedBox(height: 12,),
                          Row(
                            children:const [
                              Text(
                                'حالة الطلب - ',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xCC212121),
                                  fontSize: 13,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Text(
                                'مكتملة',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF197D47),
                                  fontSize: 13,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.3, color: Color(0xFFE1E1E1)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                   Text(
                    'إجمالي المشتريات',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w700,
                      height: 0.11,
                    ),
                  ),
                  Text(
                    '16.000',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF197D47),
                      fontSize: 16,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),


      ),
    );
  }
}
