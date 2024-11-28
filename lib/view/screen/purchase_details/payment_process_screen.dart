import 'package:comatecs/view/screen/main_home/main_home_screen.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/navigation.dart';
import '../../base/custom_button.dart';
import '../../base/text_field.dart';

class PaymentProcessScreen extends StatefulWidget {
  const PaymentProcessScreen({Key? key}) : super(key: key);

  @override
  State<PaymentProcessScreen> createState() => _PaymentProcessScreenState();
}

class _PaymentProcessScreenState extends State<PaymentProcessScreen> {
  int selected = -1;
  bool isView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ))),
                  const Text(
                    'عملية الدفع',
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
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            selected=-1;
                            isView =false;
                          });
                        },
                        child: Container(
                          height: 74,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: selected==-1?const Color(0xFF197D47):const Color(0xFFE1E1E1)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 12),
                                child: Image.asset(Images.cash),
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                              Text(
                                'الدفع عند استلام المنتج',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontSize: 16,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 12,),
                              Text(
                                'استلم منتجاتك أولاَ ثم ادفع (باليد) ',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF6F6F6F),
                                  fontSize: 12,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
const SizedBox(height: 16,),
                      SizedBox(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            // list item builder
                            itemBuilder: (BuildContext ctx, index) {
                              return  InkWell(
                                onTap: (){
                                  setState(() {
                                    selected=index;
                                    isView= true;
                                  });
                                },
                                child: Container(
                                  width: 80,
                                  height: 74,
                                  margin: const EdgeInsets.only(left: 16),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1, color: selected==index ?Theme.of(context).primaryColor:const Color(0xFFE1E1E1)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(Images.cash),
                                  ),
                                ),
                              );
                            },
                          )),
const SizedBox(height: 16,),
                      isView?Column(
                        children: [
                          Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
                            Image.asset(Images.information , width: 20,height: 20,),
                            const SizedBox(width: 12,),
                            const Expanded(
                              child: Text(
                                'لإتمام عملية الدفع عبر المحفظة، يُرجى استخدام رقم هاتف: [09987412536]',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF6F6F6F),
                                  fontSize: 12,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],),
                          const SizedBox(height: 16,),
                          Row(crossAxisAlignment:CrossAxisAlignment.center,children: [
                            Image.asset(Images.information , width: 20,height: 20,),
                            const SizedBox(width: 12,),
                            const Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'سوف يتم إرسال ',
                                      style: TextStyle(
                                        color: Color(0xCC212121),
                                        fontSize: 12,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'رمز عملية (المرجع) ',
                                      style: TextStyle(
                                        color: Color(0xFF197D47),
                                        fontSize: 12,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'الشراء الخاص بهذه العمليه , يرجى ادخاله',
                                      style: TextStyle(
                                        color: Color(0xCC212121),
                                        fontSize: 12,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                            ),
                          ],),
                          const SizedBox(height: 42,),
                          TextFromFieldWidget(
                            title: 'رمز عمليه (المرجع)',
                            type: TextInputType.number,
                            onChange: (String value) {},
                          ),

                        ],
                      ):const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.bottomCenter,
              decoration: const ShapeDecoration(
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
                    children: [
                      const Text(
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: MediaQuery.of(context).size.width * .4,
                    child: CustomButton(
                      btnTxt: 'تأكيد',
                      onTap: () {
                        AppNavigation.navigateAndFinish(
                            context, const MainHomeScreen());
                      },
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
