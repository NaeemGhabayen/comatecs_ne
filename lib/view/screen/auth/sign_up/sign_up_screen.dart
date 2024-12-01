import 'package:comatecs/data/model/response/categories_model.dart';
import 'package:comatecs/provider/constants_provider.dart';
import 'package:comatecs/utill/navigation.dart';
import 'package:comatecs/view/screen/auth/login/login_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
  const SingUpScreen({
    Key? key,
  }) : super(key: key);

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
  final TextEditingController _workInEmployeeController =
      TextEditingController();

  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _workInCommpanysFocus = FocusNode();
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

  CategoriesModel? workNatureValue;
  String? workTypeValue;
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
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.topRight,
                        child: const Icon(Icons.arrow_back_ios))),
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
                    if (value!.isEmpty) {
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
                    if (value!.isEmpty) {
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
                    if (value!.isEmpty) {
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
                    if (value!.isEmpty) {
                      return 'يجب ادخال العنوان';
                    }
                    return null;
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'طبيعية العمل',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 0.11,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 52,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .9,
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFE1E1E1),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: DropdownButton2<CategoriesModel>(
                        value: workNatureValue,
                        isExpanded: true,
                        iconStyleData: const IconStyleData(
                          iconSize: 24,
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          iconEnabledColor: Color(0xFFE1E1E1),
                          iconDisabledColor: Colors.grey,
                        ),
                        hint: Text(
                          'طبيعة العمل',
                          style: const TextStyle(
                              color: Color.fromRGBO(33, 47, 62, .61),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          padding: null,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          elevation: 8,
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: WidgetStateProperty.all<double>(6),
                            thumbVisibility:
                                WidgetStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                        underline: const SizedBox(),
                        style: const TextStyle(color: ColorResources.BLACK),
                        onChanged: (value) {
                          setState(() {
                            workNatureValue = value;
                          });
                          print(value!.name);
                        },
                        items: Provider.of<ConstantsProvider>(context,
                                listen: false)
                            .workNatureList
                            .map<DropdownMenuItem<CategoriesModel>>(
                                (CategoriesModel value) {
                          return DropdownMenuItem<CategoriesModel>(
                            value: value,
                            child: Text(value.name!),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
                workNatureValue == null
                    ? SizedBox()
                    : workNatureValue!.name == 'اخرى'
                        ? TextFromFieldWidget(
                            title: 'اخرى',
                            type: TextInputType.text,
                            onChange: (String value) {},
                            controller: _workNatureController,
                            validator: (value) {
                              if (workNatureValue!.name == 'اخرى') {
                                if (value!.isEmpty) {
                                  return 'يجيب ادخال طبيعة العمل';
                                }
                                return null;
                              } else {
                                return null;
                              }
                            },
                            obscureText: false,
                          )
                        : const SizedBox(),
                workNatureValue == null
                    ? SizedBox()
                    : workNatureValue!.name == 'صاحب مهنة'
                        ? Column(
                            children: [
                              CustomDropDownField(
                                  title: 'نوع الشركة',
                                  onChange: (value) {
                                    setState(() {
                                      workTypeValue = value;
                                      print(value);
                                    });
                                  },
                                  list: Provider.of<ConstantsProvider>(context,
                                          listen: false)
                                      .workTypeList,
                                  value: workTypeValue,
                                  width: true),
                              TextFromFieldWidget(
                                title: 'عدد الموظفين',
                                type: TextInputType.number,
                                onChange: (String value) {},
                                controller: _numberOFEmployeeController,
                                nextNode: _workInCommpanysFocus,
                                validator: (value) {
                                  if (workNatureValue!.name == 'صاحب مهنة') {
                                    if (value!.isEmpty) {
                                      return 'يجب ادخال عدد الموظفين';
                                    }
                                    return null;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFromFieldWidget(
                                title: 'وظيفتك داخل الشركة',
                                type: TextInputType.text,
                                onChange: (String value) {},
                                focusNode: _workInCommpanysFocus,
                                controller: _workInEmployeeController,
                                validator: (value) {
                                  if (workNatureValue!.name == 'صاحب مهنة') {
                                    if (value!.isEmpty) {
                                      return 'يجب ادخال وظيفتك داخل الشركة';
                                    }
                                    return null;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width * .9,
                    child: CustomButton(
                        btnTxt: 'تسجيل جديد',
                        isLoading:
                            Provider.of<AuthProvider>(context, listen: true)
                                .isLoading,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            register = RegisterModel();
                            register.email = _emailController.text;
                            register.fullName = _userNameController.text;
                            register.address = _addressController.text;
                            register.phoneNumber = _phoneController.text;
                            register.companyType =
                                workNatureValue!.name == 'صاحب مهنة' ? 2 : 1;
                            if (workNatureValue!.name == 'صاحب مهنة') {
                            } else {
                              register.numberOfEmployees = int.parse(
                                  _numberOFEmployeeController.text ?? '0');
                              register.workInCompany =
                                  _workInEmployeeController.text;
                            }
                            register.workType = (workNatureValue!.name == 'اخرى'
                                ? _workNatureController.text
                                : workNatureValue!.name)!;
                            _formKey.currentState!.save();
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
                SizedBox(
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "تم تسجيل اشتراكك بنجاح سيتم ارسال كلمة المرور الى البريد الالكتروني يرجى التحقق من ذلك"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ));
      AppNavigation.navigateTo(context, const LoginScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }
}
