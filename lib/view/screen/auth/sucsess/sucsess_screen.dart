import 'package:comatecs/view/screen/main_home/main_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../../utill/navigation.dart';
import '../../../base/custom_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key, }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

           const SizedBox(width: double.infinity,),
            SvgPicture.asset(Images.truee),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 8),
              child: const Text(
                'تم تعيين كلمة المرور بنجاح',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),

            Container(
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height*.3,
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width * .9,
                child: CustomButton(
                    btnTxt: 'الصفحة الرئيسية',
                    onTap: () {
                      AppNavigation.navigateAndFinish(context, const MainHomeScreen());
                      print('object');
                    })),

          ],
        ),
      ),
    );
  }
}
