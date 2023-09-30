import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../../utill/navigation.dart';
import '../../../base/custom_button.dart';
import '../../../base/text_field.dart';
import '../sucsess/sucsess_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                  margin: const EdgeInsets.only(top: 16, bottom: 12),
                  child: const Text(
                    "تغيير كلمة المرور",
                    style: TextStyle(
                        color: ColorResources.BLACK,
                        fontWeight: FontWeight.w500,
                        fontSize: 23),
                  )),
              SizedBox(
                height: 40,
              ),
              TextFromFieldWidget(
                title: 'كلمة المرور',
                type: TextInputType.text,
                onChange: (String value) {},
                focusNode: _passwordFocus,
                controller: _passwordController,
                obscureText: true,
                nextNode: _confirmPasswordFocus,
              ),
              TextFromFieldWidget(
                title: 'تأكيد كلمة المرور',
                type: TextInputType.text,
                onChange: (String value) {},
                focusNode: _confirmPasswordFocus,
                obscureText: true,
                controller: _confirmPasswordController,
              ),

              Container(
                height: MediaQuery.of(context).size.height*.35,
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * .8,
                  child: CustomButton(
                      btnTxt: 'إعادة تعيين',
                      onTap: () {
                         AppNavigation.navigateTo(context, SuccessScreen());
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
