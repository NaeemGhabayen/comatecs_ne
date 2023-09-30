import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/base/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';
import '../invoice/invoice_screen.dart';
import '../widget/order_summary_card.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsSCreenState();
}

class _OrderDetailsSCreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ))),
                  const Text(
                    'تفاصيل الطلب',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      OrderSummaryCard(),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
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
                            const Text(
                              'تفاصيل الطلب',
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
                            ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext ctx, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'الاسم التجاري للمنتج',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF212121),
                                        fontSize: 14,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'الكمية * 1',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF212121),
                                            fontSize: 13,
                                            fontFamily: 'Tajawal',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          '8.000',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF197D47),
                                            fontSize: 13,
                                            fontFamily: 'Tajawal',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    index == 1
                                        ? SizedBox()
                                        : Container(
                                            margin:
                                                EdgeInsets.symmetric(vertical: 8),
                                            child: Divider(
                                              color: Color(0xFFE1E1E1),
                                            )),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
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
                            const Text(
                              'مبلغ الطلب',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF212121),
                                fontSize: 14,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: const Divider(
                                  color: Color(0xFFE1E1E1),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'المجموع الفرعي',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 13,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '16.000',
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
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'الشحن',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 13,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '16.000',
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
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: const Divider(
                                  color: Color(0xFFE1E1E1),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'السعر الإجمالي',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF197D47),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '32.000',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF197D47),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'مجموع النقاط',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '230 ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        btnTxt: 'احصل على فاتورة',
                        onTap: () {
                          AppNavigation.navigateTo(context, InvoiceScreen());
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
