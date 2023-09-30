import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/main_home/main_home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../base/custom_button.dart';
import '../../../base/text_field.dart';
import '../forget_passwrod/forget_passwrod_screen.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool showvalue = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Image.asset(Images.logo),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: const Text(
                  'تسجيل دخول',
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
                margin: const EdgeInsets.only(top: 4, bottom: 50),
                child: const Text(
                  'مرحباَ بعودتك مجدداَ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xB2212121),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              TextFromFieldWidget(
                title: 'إيميل المستخدم/ اسم المستخدم',
                type: TextInputType.emailAddress,
                onChange: (String value) {},
                focusNode: _emailFocus,
                controller: _emailController,
                nextNode: _passwordFocus,
              ),
              TextFromFieldWidget(
                title: 'كلمة المرور',
                type: TextInputType.text,
                onChange: (String value) {},
                focusNode: _passwordFocus,
                controller: _passwordController,
                obscureText: true,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).primaryColor,
                            value: showvalue,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            ),
                            onChanged: (bool value) {
                              showvalue = value;
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'تذكرني',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            height: .11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        print('ssssssssssssss');
                        AppNavigation.navigateTo(
                            context, ForgetPasswordScreen());
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: const Text(
                          'هل نسيت كلمة المرور؟',
                          style: TextStyle(
                            color: Color(0xFF178047),
                            fontSize: 14,
                            fontFamily: 'Effra',
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            height: 0.11,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .3,
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * .9,
                  child: CustomButton(
                      btnTxt: 'تسجيل الدخول',
                      onTap: () {
                        AppNavigation.navigateTo(context, MainHomeScreen());
                      })),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'مستخدم جديد؟',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                        onTap: () {
                          AppNavigation.navigateTo(
                              context, const SingUpScreen());
                        },
                        child: Text(
                          'إنشاء حساب جديد',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontFamily: 'Effra',
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
