import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/body/register_model.dart';
import '../../../../provider/auth_provider.dart';
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
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _workNatureController = TextEditingController();
  final TextEditingController _numberOFEmployeeController =
      TextEditingController();

  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  bool showvalue = false;

  RegisterModel register = RegisterModel();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _numberOFEmployeeController.dispose();
    _addressController.dispose();
    _workNatureController.dispose();
  }

  List<String> maritalStatusList = <String>[
    ' ',
    "تست",
    "تست2",
    "اخرى",
  ];

  List<String> workNatureListValue = <String>[
    ' ',
    "تست",
    "تست2",
    "اخرى",
  ];
  List<String> workNatureList = <String>[
    ' ',
    "صاحب مهنة",
    "صاحب شركة",
  ];
  String maritalStatusValue;
  String wrokNatureStutsValue;
  String workNatureValue;
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
                  title: 'الاسم كاملا',
                  type: TextInputType.emailAddress,
                  onChange: (String value) {},
                  focusNode: _userNameFocus,
                  controller: _userNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'يجب ادخال الاسم كامل';
                    }
                    return null;
                  },
                  nextNode: _emailFocus,
                ),
                TextFromFieldWidget(
                  title: 'إيميل المستخدم',
                  type: TextInputType.emailAddress,
                  onChange: (String value) {},
                  focusNode: _emailFocus,
                  controller: _emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'يجب ادخال البريد الالكتروني';
                    } else if (!value.toString().contains('@')) {
                      return 'يجب ادخال بريد الكتروني صالح';
                    }
                    return null;
                  },
                  nextNode: _phoneFocus,
                ),
                TextFromFieldWidget(
                  title: 'رقم الهاتف',
                  type: TextInputType.phone,
                  onChange: (String value) {},
                  focusNode: _phoneFocus,
                  controller: _phoneController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'يجب ادخال رقم الهاتف';
                    }
                    return null;
                  },
                  nextNode: _addressFocus,
                ),
                TextFromFieldWidget(
                  title: 'العنوان',
                  type: TextInputType.streetAddress,
                  onChange: (String value) {},
                  focusNode: _addressFocus,
                  controller: _addressController,
                  nextNode: _passwordFocus,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'يجب ادخال العنوان';
                    }
                    return null;
                  },
                ),
                CustomDropDownField(
                    title: 'نوع الشركة',
                    onChange: (value) {
                      setState(() {
                        workNatureValue = value;
                        print(value);
                      });
                    },
                    list: workNatureList,
                    value: workNatureValue,
                    width: true),
                CustomDropDownField(
                    title: 'طبيعية العمل',
                    onChange: (value) {
                      setState(() {
                        wrokNatureStutsValue = value;
                      });
                    },
                    list: workNatureListValue,
                    value: wrokNatureStutsValue,
                    width: true),
                wrokNatureStutsValue == 'اخرى'
                    ? TextFromFieldWidget(
                        title: 'اخرى',
                        type: TextInputType.text,
                        onChange: (String value) {},
                        controller: _workNatureController,
                  validator: (value) {
                          if(   wrokNatureStutsValue == 'اخرى'){
                            if (value.isEmpty) {
                              return 'يجيب ادخال طبيعة العمل';
                            }
                            return null;
                          }else{
                            return null;
                          }

                  },
                        obscureText: false,
                      )
                    : SizedBox(),
                workNatureValue == 'صاحب مهنة'
                    ? SizedBox()
                    : Column(
                        children: [
                          TextFromFieldWidget(
                            title: 'عدد الموظفين',
                            type: TextInputType.number,
                            onChange: (String value) {},
                            controller: _numberOFEmployeeController,
                            validator: (value) {
                              if (workNatureValue == 'صاحب مهنة') {
                                if (value.isEmpty) {
                                  return 'يجب ادخال رقم الهاتف';
                                }
                                return null;
                              } else {
                                return null;
                              }
                            },
                          ),
                          CustomDropDownField(
                              title: 'وظيفتتك داخل الشركة',
                              onChange: (value) {
                                setState(() {});
                              },
                              list: maritalStatusList,
                              value: maritalStatusValue,
                              width: true),
                        ],
                      ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width * .9,
                    child: CustomButton(
                        btnTxt: 'تسجيل جديد',
                        // isLoading:
                        //     Provider.of<AuthProvider>(context, listen: true)
                        //         .isLoading,
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            register = RegisterModel();
                            register.email = _emailController.text;
                            register.fullName = _userNameController.text;
                            register.address = _addressController.text;
                            register.phoneNumber = _phoneController.text;
                            register.companyType =
                            workNatureValue == 'صاحب مهنة' ? 2 : 1;
                            if( workNatureValue == 'صاحب مهنة'){

                            }else{
                              register.numberOfEmployees = int.parse(_numberOFEmployeeController.text ?? '0');
                              register.workInCompany = 'test2';
                            }
                            register.workType = wrokNatureStutsValue=='اخرى'?_workNatureController.text:wrokNatureStutsValue;
                            _formKey.currentState.save();
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .registration(register, route);
                            print('Form submitted with value:');
                          } else {
                            print('object');
                          }
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
                            AppNavigation.navigateTo(
                                context, const LoginScreen());
                          },
                          child: Text(
                            'تسجيل دخول',
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
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.green));
      AppNavigation.navigateTo(context, LoginScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }
}
