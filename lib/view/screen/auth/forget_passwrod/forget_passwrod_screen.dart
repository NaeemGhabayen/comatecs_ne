import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../../utill/navigation.dart';
import '../../../base/custom_button.dart';
import '../../../base/text_field.dart';
import '../change_password/change_password_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_back_ios))),
              SizedBox(
                height: 30,
              ),
              Image.asset(Images.logo),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 8),
                child: const Text(
                  'إعادة تعيين كلمة المرور',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFromFieldWidget(
                title: 'إيميل المستخدم',
                type: TextInputType.emailAddress,
                onChange: (String value) {},
                focusNode: _emailFocus,
                controller: _emailController,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .45,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * .9,
                  child: CustomButton(
                      btnTxt: 'إرسال',
                      onTap: () {
                        AppNavigation.navigateTo(context, ChangePasswordScreen());
                        print('object');
                      })),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
