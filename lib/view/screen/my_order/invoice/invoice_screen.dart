import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';
import '../../../base/custom_button.dart';
import '../widget/order_summary_card.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
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
                    'فاتورة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 0,
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
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(

                                  height: 41, alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12,right: 12),
                                  decoration:const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Color(0xB2E1E1E1)),
                                      top: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                      right: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                      bottom: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                    ),
                                  ),
                                  child:const Text(
                                    'المنتج',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF1C1C1C),
                                      fontSize: 13,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.2,
                                height: 41,
                                alignment: Alignment.center,
                                decoration:const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Color(0xB2E1E1E1)),
                                    top: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                    right: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                    bottom: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child:const Text(
                                  'الكمية',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF1C1C1C),
                                    fontSize: 13,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.2,
                                height: 41,
                                alignment: Alignment.center,
                                decoration:const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child:const Text(
                                  'السعر',
                                  style: TextStyle(
                                    color: Color(0xFF1C1C1C),
                                    fontSize: 13,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext ctx, index) {
                              return  Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                                              padding: EdgeInsets.only(left: 12,right: 12),

                                      height: 41,alignment: Alignment.centerRight,
                                      decoration:const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: Color(0xB2E1E1E1)),
                                          top: BorderSide(
                                              width: 0.50, color: Color(0xB2E1E1E1)),
                                          right: BorderSide(
                                              width: 0.50, color: Color(0xB2E1E1E1)),
                                          bottom: BorderSide(
                                              width: 0.50, color: Color(0xB2E1E1E1)),
                                        ),
                                      ),
                                      child:const Text(
                                        'اسم المنتج 1',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xB2212121),
                                          fontSize: 12,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width*.2,
                                    height: 41,
                                    alignment: Alignment.center,
                                    decoration:const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Color(0xB2E1E1E1)),
                                        top: BorderSide(
                                            width: 0.50, color: Color(0xB2E1E1E1)),
                                        right: BorderSide(
                                            width: 0.50, color: Color(0xB2E1E1E1)),
                                        bottom: BorderSide(
                                            width: 0.50, color: Color(0xB2E1E1E1)),
                                      ),
                                    ),
                                    child:const Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xB2212121),
                                        fontSize: 12,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width*.2,
                                    height: 41,
                                    alignment: Alignment.center,
                                    decoration:const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.50, color: Color(0xB2E1E1E1)),
                                      ),
                                    ),
                                    child:const Text(
                                      '16.000',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xB2212121),
                                        fontSize: 13,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
SizedBox(height: 24,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(

                                  height: 41, alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12,right: 12),
                                  decoration:const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Color(0xB2E1E1E1)),
                                      top: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                      right: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                      bottom: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                    ),
                                  ),
                                  child:const Text(
                                    'اجمالي التوصيل',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF212121),
                                      fontSize: 13,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.3,
                                height: 41,
                                alignment: Alignment.center,
                                decoration:const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child:const Text(
                                  '5 د.أ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xB2212121),
                                    fontSize: 13,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(

                                  height: 41, alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12,right: 12),
                                  decoration:const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Color(0xB2E1E1E1)),
                                      top: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                      right: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                      bottom: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                    ),
                                  ),
                                  child:const Text(
                                    'السعر الإجمالي',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF197D47),
                                      fontSize: 14,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.3,
                                height: 41,
                                alignment: Alignment.center,
                                decoration:const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child:const  Text(
                                  '32.000 د.أ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF197D47),
                                    fontSize: 14,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 41, alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12,right: 12),
                                  decoration:const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Color(0xB2E1E1E1)),
                                      top: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                      right: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                      bottom: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                    ),
                                  ),
                                  child:const Text(
                                    'مجموع النقاط',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF212121),
                                      fontSize: 14,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.3,
                                height: 41,
                                alignment: Alignment.center,
                                decoration:const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child:const  Text(
                                  '230 ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 40,),
                      CustomButton(
                        btnTxt: 'تصدير كملف pdf',
                        onTap: () {},
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
