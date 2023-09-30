import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_drop_down_field.dart';
import '../../../base/text_field.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  bool showvalue = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  List<String> maritalStatusList = <String>[
    ' ',
    "single",
    "married",
    "absolute",
  ];
  String maritalStatusValue;
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
                height: MediaQuery.of(context).size.height * .02,
              ),
              InkWell(onTap:(){Navigator.pop(context);},child: Container(padding:EdgeInsets.symmetric(horizontal: 12),alignment: Alignment.topRight,child: Icon(Icons.arrow_back_ios))),
              Image.asset(Images.logo),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: const Text(
                  'تسجيل جديد',
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
                  'مرحبًا بك, استمتع بتجربة تسوق مميزة معناَ',
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
                nextNode: _phoneFocus,
              ),
              TextFromFieldWidget(
                title: 'رقم الهاتف',
                type: TextInputType.phone,
                onChange: (String value) {},
                focusNode: _phoneFocus,
                controller: _phoneController,
                nextNode: _addressFocus,
              ),
              TextFromFieldWidget(
                title: 'العنوان',
                type: TextInputType.streetAddress,
                onChange: (String value) {},
                focusNode: _addressFocus,
                controller: _addressController,
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

              CustomDropDownField(
                  title: 'طبيعية العمل',
                  onChange: (value) {
                    setState(() {});
                  },
                  list: maritalStatusList,
                  value: maritalStatusValue,
                  width: true),
              CustomDropDownField(
                  title: 'نوع الشركة',
                  onChange: (value) {
                    setState(() {});
                  },
                  list: maritalStatusList,
                  value: maritalStatusValue,
                  width: true),    CustomDropDownField(
                  title: 'عدد الموظفين',
                  onChange: (value) {
                    setState(() {});
                  },
                  list: maritalStatusList,
                  value: maritalStatusValue,
                  width: true),   CustomDropDownField(
                  title: 'وظيفتتك داخل الشركة',
                  onChange: (value) {
                    setState(() {});
                  },
                  list: maritalStatusList,
                  value: maritalStatusValue,
                  width: true),

              Container(
                margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * .9,
                  child:
                  CustomButton(btnTxt: 'تسجيل جديد', onTap: () {})),
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
                      'يوجد حساب؟',
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
                          AppNavigation.navigateTo(context, const LoginScreen());
                        },
                        child:  Text(
                          'تسجيل دخول',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,fontFamily: 'Effra',
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
