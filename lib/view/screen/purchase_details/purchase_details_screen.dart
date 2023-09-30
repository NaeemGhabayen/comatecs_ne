import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/purchase_details/widget/promotion_code_model_sheet.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../base/custom_button.dart';
import '../../base/custom_button_outline.dart';
import '../home/widget/fillter_model_sheet.dart';
import '../my_address/widget/add_address_model_sheet.dart';
import '../my_order/widget/order_summary_card.dart';
import 'payment_process_screen.dart';

class PurchaseDetailsScreen extends StatefulWidget {
  const PurchaseDetailsScreen({key});

  @override
  State<PurchaseDetailsScreen> createState() => _PurchaseDetailsScreenState();
}

class _PurchaseDetailsScreenState extends State<PurchaseDetailsScreen> {
  int selected = 0;
  int indexSelcted = 0;

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
                    'تفاصيل الشراء',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(

                                  height: 41,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  decoration: const BoxDecoration(
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
                                  child: const Text(
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
                                width: MediaQuery.of(context).size.width * .2,
                                height: 41,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
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
                                child: const Text(
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
                                width: MediaQuery.of(context).size.width * .2,
                                height: 41,
                                alignment: Alignment.center,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child: const Text(
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
                              return Row(
                                children: [
                                  Expanded(
                                    child: Container(

                                      padding:
                                          EdgeInsets.only(left: 12, right: 12),
                                      height: 41,
                                      alignment: Alignment.centerRight,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Color(0xB2E1E1E1)),
                                          top: BorderSide(
                                              width: 0.50,
                                              color: Color(0xB2E1E1E1)),
                                          right: BorderSide(
                                              width: 0.50,
                                              color: Color(0xB2E1E1E1)),
                                          bottom: BorderSide(
                                              width: 0.50,
                                              color: Color(0xB2E1E1E1)),
                                        ),
                                      ),
                                      child: const Text(
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
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: 41,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Color(0xB2E1E1E1)),
                                        top: BorderSide(
                                            width: 0.50,
                                            color: Color(0xB2E1E1E1)),
                                        right: BorderSide(
                                            width: 0.50,
                                            color: Color(0xB2E1E1E1)),
                                        bottom: BorderSide(
                                            width: 0.50,
                                            color: Color(0xB2E1E1E1)),
                                      ),
                                    ),
                                    child: const Text(
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
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    height: 41,
                                    alignment: Alignment.center,
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.50,
                                            color: Color(0xB2E1E1E1)),
                                      ),
                                    ),
                                    child: const Text(
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
                      SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 41,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  decoration: const BoxDecoration(
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
                                  child: const Text(
                                    'رمز العرض الترويجي',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFE25440),
                                      fontSize: 13,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                      height: 0.14,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return const FractionallySizedBox(
                                          child: PromotionCodeModelSheet(),
                                        );
                                      });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height: 41,
                                  alignment: Alignment.center,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.50, color: Color(0xB2E1E1E1)),
                                    ),
                                  ),
                                  child: const Text(
                                    'إدخال الرمز',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF197D47),
                                      fontSize: 13,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 41,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  decoration: const BoxDecoration(
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
                                  child: const Text(
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
                                width: MediaQuery.of(context).size.width * .3,
                                height: 41,
                                alignment: Alignment.center,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child: const Text(
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
                                  height: 41,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  decoration: const BoxDecoration(
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
                                  child: const Text(
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
                                width: MediaQuery.of(context).size.width * .3,
                                height: 41,
                                alignment: Alignment.center,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child: const Text(
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
                                  height: 41,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  decoration: const BoxDecoration(
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
                                  child: const Text(
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
                                width: MediaQuery.of(context).size.width * .3,
                                height: 41,
                                alignment: Alignment.center,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xB2E1E1E1)),
                                  ),
                                ),
                                child: const Text(
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
                      SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'عملية الشحن',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 16,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = 0;
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(4),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFFD0D5DD)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Container(
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selected == 0
                                              ? Theme.of(context).primaryColor
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'استلام شخصي',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF1C1C1C),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'استلام الطلب من مقر الرئيسي للشركة',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                                fontSize: 13,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = 1;
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(4),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFFD0D5DD)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Container(
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selected == 1
                                              ? Theme.of(context).primaryColor
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'توصيل الطلب',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF1C1C1C),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'توصيل الطلب إلى عنوان التوصيل الذي تحدده',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                                fontSize: 13,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                indexSelcted = index;
                                              });
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              padding: const EdgeInsets.all(4),
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFD0D5DD)),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: indexSelcted == index
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'عنوان 2',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: indexSelcted != index
                                                  ? Color(0xFF6F6F6F)
                                                  : Color(0xFF1C1C1C),
                                              fontSize: 13,
                                              fontFamily: 'Tajawal',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        Images.edit,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                        const    SizedBox(
                              height: 16,
                            ),
                            CustomButtonOutline(
                              btnTxt: 'إضافة عنوان جديد',
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return const FractionallySizedBox(
                                        child: AddAddressModelSheet(),
                                      );
                                    });
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ملاحظات',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF1C1C1C),
                              fontSize: 15,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 8,),
                          Image.asset(Images.edit , width: 14 ,height: 14,),
                        ],
                      ),
                      Container(
                        height: 100,
                        margin: const EdgeInsets.only(top: 16),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.multiline,
                       style: const TextStyle(
                         color: Color(0xFF1C1C1C),
                         fontSize: 13,
                         fontFamily: 'Tajawal',
                         fontWeight: FontWeight.w500,
                         height: 0.14,
                       ),
                          maxLines: null,

                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            hintText: 'اكتب ملاحظاتك على الطلب ...',
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(33, 47, 62, .61),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.bottomCenter,
                        decoration:const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                const  Text(
                                  'المبلغ الاجمالي:',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 14,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  '16.000 JOD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            Container(margin: EdgeInsets.symmetric(vertical: 8),width: MediaQuery.of(context).size.width*.4,child: CustomButton(btnTxt: 'التالي',onTap: (){
                              AppNavigation.navigateTo(context,const PaymentProcessScreen());
                            },),)
                          ],
                        ),
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
