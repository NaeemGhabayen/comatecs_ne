import 'package:comatecs/utill/navigation.dart';
import 'package:flutter/material.dart';

import '../../../utill/images.dart';
import '../../base/show_dialog.dart';
import '../constant/about_us/about_us_screen.dart';
import '../constant/technical_support/technical_support_screen.dart';
import '../my_address/my_address_screen.dart';
import 'edit_profile_screen.dart';
import 'widget/item_profile.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .25,
              child: Stack(
                children: [
                  Positioned(
                    top: -20,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/background.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.7900000214576721),
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 0.50, color: Color(0x7FE1E1E1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        '500 نقطة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF197D47),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        Images.avatar,
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'عمر محمد',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            const Text(
              'Omar.M@gmail.com',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0x7F1C1C1C),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Color(0x1E197D47),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50, color: Color(0xFFE1E1E1)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                '500 نقطة',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0x7F1C1C1C),
                  fontSize: 14,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ItemProfile(
              title: 'تعديل الملف الشخصي',
              onPress: () {
                AppNavigation.navigateTo(context, EditProfileScreen());
              },
              icon: Images.edit,
            ),
            ItemProfile(
              title: 'العنوان',
              onPress: () {
                AppNavigation.navigateTo(context, const MyAddressScreen());
              },
              icon: Images.location,
            ),
            ItemProfile(
              title: 'من نحن',
              onPress: () {
                AppNavigation.navigateTo(context, AboutUsScreen());
              },
              icon: Images.users,
            ),
            ItemProfile(
              title: 'الدعم الفني',
              onPress: () {
                AppNavigation.navigateTo(context, TechnicalSupportScreen());
              },
              icon: Images.call,
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ShowCustomDialog(title:'الخروج من الحساب' ,desAgree: 'إلغاء',textAgree:'تسجيل خروج' ,description:'هل انت متأكد من عملية الخروج من حسابك ,تأكد من حفظ بياناتك للرجوع مرة أخرى' ,failed: (){Navigator.pop(context);},ok: (){},);

                    });
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE1E1E1)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      Images.logout,
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'تسجيل الخروج',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 15,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
