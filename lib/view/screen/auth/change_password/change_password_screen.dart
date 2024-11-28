import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/auth_provider.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../../utill/navigation.dart';
import '../../../base/custom_button.dart';
import '../../../base/text_field.dart';
import '../sucsess/sucsess_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _currentPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.topRight,
                      child: const Icon(Icons.arrow_back_ios))),
              const SizedBox(
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
              const SizedBox(
                height: 40,
              ),
              Form(
                child: Column(
                  children: [
                    TextFromFieldWidget(
                      title: 'كلمة المرور الحالية',
                      type: TextInputType.text,
                      onChange: (String value) {
                        if (value.isEmpty) {
                          return 'يجب ادخال كلمة المرور الحالية';
                        }
                        return null;
                      },
                      focusNode: _currentPasswordFocus,
                      controller: _currentPasswordController,
                      obscureText: true,
                      nextNode: _passwordFocus,
                    ),
                    TextFromFieldWidget(
                      title: 'كلمة المرور الجديدة',
                      type: TextInputType.text,
                      onChange: (String? value) {
                        if (value!.isEmpty) {
                          return 'يجب ادخال كلمة المرور الجديدة';
                        }
                        return null;
                      },
                      focusNode: _passwordFocus,
                      controller: _passwordController,
                      obscureText: true,
                      nextNode: _confirmPasswordFocus,
                    ),
                    TextFromFieldWidget(
                      title: 'تأكيد كلمة المرور',
                      type: TextInputType.text,
                      onChange: (String? value) {
                        if (value!.isEmpty) {
                          return 'يجب ادخال تاكيد كلمة المرور';
                        }else if(value.toString()==_passwordController.text.toString()){
                          return 'يجب تطابق كلمتا المرور';
                        }
                        return null;
                      },
                      focusNode: _confirmPasswordFocus,
                      obscureText: true,
                      controller: _confirmPasswordController,
                    ),
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .35,
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * .8,
                  child: CustomButton(
                      btnTxt: 'إعادة تعيين',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .changePassword(
                                  email: "n3eem.1999@gmail.com",
                                  newPassword: _passwordController.text,
                                  currentPassword: _currentPasswordController.text,
                                  callback: route);
                          print('Form submitted with value:');
                        } else {
                          print('object');
                        }
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

  route(bool isRoute, String errorMessage) async {
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.green));
      AppNavigation.navigateAndFinish(context, const SuccessScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }
}
