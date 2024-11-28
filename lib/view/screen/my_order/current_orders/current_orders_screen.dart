import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/my_order/order_details/order_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';

class CurrentOrdersScreen extends StatefulWidget {
  const CurrentOrdersScreen({Key? key, }) : super(key: key);

  @override
  State<CurrentOrdersScreen> createState() => _CurrentOrdersScreenState();
}

class _CurrentOrdersScreenState extends State<CurrentOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body:  SafeArea(
        child: InkWell(
          onTap: (){
            AppNavigation.navigateTo(context, const OrderDetailsScreen());
          },
          child: Container(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext ctx, index) {
                return    Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
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
                      const SizedBox(height: 12,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
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
                                'غير مدفوعة',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFFE25440),
                                  fontSize: 13,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          Text(
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
                      const SizedBox(height: 12,),
                      const Row(
                        children:[
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
                            'قيد المراجعة',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xCC505050),
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
      ),


    );
  }
}
