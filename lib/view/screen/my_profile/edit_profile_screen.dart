import 'package:comatecs/utill/app_constants.dart';
import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/my_profile/widget/item_profile.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import 'edit_password_screen.dart';
import 'edit_user_profile_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                height: 24,
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

              ItemProfile(title: 'تعديل البيانات الشخصية',onPress: (){AppNavigation.navigateTo(context, EditUserProfileScreen());},icon: Images.edit,),
              ItemProfile(title: 'تعديل كلمة المرور',onPress: (){AppNavigation.navigateTo(context, EditPasswordScreen());},icon: Images.edit,),

            ],
          ),
        ),
      ),
    );
  }
}
