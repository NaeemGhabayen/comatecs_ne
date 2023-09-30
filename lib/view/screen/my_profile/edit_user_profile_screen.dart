import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../base/custom_button.dart';
import '../../base/custom_drop_down_field.dart';
import '../../base/text_field.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({key});

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                            child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ))),
                    const Text(
                      'تعديل كلمة المرور',
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
              SizedBox(
                height: 36,
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
                  width: true),
              CustomDropDownField(
                  title: 'عدد الموظفين',
                  onChange: (value) {
                    setState(() {});
                  },
                  list: maritalStatusList,
                  value: maritalStatusValue,
                  width: true),
              CustomDropDownField(
                  title: 'وظيفتتك داخل الشركة',
                  onChange: (value) {
                    setState(() {});
                  },
                  list: maritalStatusList,
                  value: maritalStatusValue,
                  width: true),
              Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * .8,
                  child: CustomButton(btnTxt: 'حفظ', onTap: () {})),
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
