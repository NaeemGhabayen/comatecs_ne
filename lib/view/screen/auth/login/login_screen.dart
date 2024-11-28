import 'package:comatecs/data/model/body/login_model.dart';
import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/main_home/main_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/adverstiment_provider.dart';
import '../../../../provider/auth_provider.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../base/custom_button.dart';
import '../../../base/text_field.dart';
import '../forget_passwrod/forget_passwrod_screen.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool showvalue = false;

  LoginModel login = LoginModel();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يجب ادخال البريد الالكتروني';
                    } else if (!value.toString().contains('@')) {
                      return 'يجب ادخال بريد الكتروني صالح';
                    }
                    return null;
                  },
                ),
                TextFromFieldWidget(
                  title: 'كلمة المرور',
                  type: TextInputType.text,
                  onChange: (String value) {},
                  focusNode: _passwordFocus,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'يجب ادخال كلمة االمرور';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(
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
                              onChanged: (bool? value) {
                                showvalue = value!;
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
                          AppNavigation.navigateTo(
                              context, const ForgetPasswordScreen());
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .22,),
                Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width * .9,
                    child: CustomButton(
                        btnTxt: 'تسجيل الدخول',
                        isLoading: Provider.of<AuthProvider>(context, listen: true).isLoading,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            login = LoginModel();
                            login.email = _emailController.text;
                            login.password = _passwordController.text;
                            await Provider.of<AuthProvider>(context, listen: false).login(login, route, context,);
                          } else {
                            print('object');
                          }
                        })),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
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
      ),
    );
  }

  route(bool isRoute, String errorMessage) async {
    if (isRoute) {
      Provider.of<AuthProvider>(context, listen: false)
          .updateRemember(showvalue);
      Provider.of<AdvertisementProvider>(context, listen: false).getAdvertisementList(context);
      AppNavigation.navigateAndFinish(context, const MainHomeScreen());
      // Provider.of<AuthProvider>(context).loginController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }
}
