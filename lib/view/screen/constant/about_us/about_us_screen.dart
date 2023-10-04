import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/constant/constant_screen/about_cmatecs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/constants_provider.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../my_profile/edit_password_screen.dart';
import '../../my_profile/edit_user_profile_screen.dart';
import '../../my_profile/widget/item_profile.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ConstantsProvider>(context, listen: false)
        .getAboutUsList(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(

                            child: Icon(Icons.arrow_back_ios,size: 20,))),
                    const Text(
                      'تعديل الملف الشخصي',
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

              ItemProfile(title: 'عن  Comatecs',onPress: (){AppNavigation.navigateTo(context, const ConstantScreen(title: 'عن  Comatecs',));},),
              ItemProfile(title: 'شروط و سياسة الاستخدام',onPress: (){},),

            ],
          ),
        ),
      ),
    );
  }
}
