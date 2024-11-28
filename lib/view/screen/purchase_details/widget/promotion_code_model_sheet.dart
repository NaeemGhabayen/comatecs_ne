import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../base/custom_button.dart';
import '../../../base/text_field.dart';

class PromotionCodeModelSheet extends StatefulWidget {
  const PromotionCodeModelSheet({Key? key,}) : super(key: key);

  @override
  State<PromotionCodeModelSheet> createState() => _PromotionCodeModelSheetState();
}

class _PromotionCodeModelSheetState extends State<PromotionCodeModelSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        color: Colors.transparent,
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: ColorResources.BACKGROUND,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Container(
                      width: 67,
                      height: 5,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF212121),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.promotion,
                  width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'تطبيق الرمز الترويجي',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF1C1C1C),
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24,),


                TextFromFieldWidget(
                  title: 'رمز العرض الترويجي',
                  type: TextInputType.emailAddress,
                  onChange: (String value) {},
                ),


                Container(margin:const EdgeInsets.only(top: 16,left: 12,right: 12),child: CustomButton(btnTxt: 'تأكيد', onTap: () {Navigator.pop(context);})),
              ],
            )),
      ),
    );
  }
}
