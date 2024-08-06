import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/navigation.dart';
import '../../base/custom_button.dart';
import '../../base/text_field.dart';
import '../auth/sucsess/sucsess_screen.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFromFieldWidget(
                      title: 'كلمة المرور الحالية',
                      type: TextInputType.text,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'يجب ادخال كلمة المرور الحالية';
                        }
                        return null;
                      },
                      focusNode: _currentPasswordFocus,
                      onChange: (String value) {},
                      controller: _currentPasswordController,
                      obscureText: true,
                      nextNode: _passwordFocus,
                    ),
                    TextFromFieldWidget(
                      title: 'كلمة المرور الجديدة',
                      type: TextInputType.text,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'يجب ادخال كلمة المرور الجديدة';
                        }
                        return null;
                      },
                      focusNode: _passwordFocus,
                      controller: _passwordController,
                      obscureText: true,
                      nextNode: _confirmPasswordFocus,
                      onChange: (String value) {},
                    ),
                    TextFromFieldWidget(
                      title: 'تأكيد كلمة المرور',
                      type: TextInputType.text,
                      onChange: (String value) {},
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'يجب ادخال تاكيد كلمة المرور';
                        } else if (value.toString() !=
                            _passwordController.text.toString()) {
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
              SizedBox(height: MediaQuery.of(context).size.height * .35,),
              Container(
                height: 45,
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * .8,
                  child: CustomButton(
                      btnTxt: 'حفظ',
                      isLoading: Provider.of<AuthProvider>(context, listen: true).isLoading,
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .changePassword(
                                  email: "n3eem.1999@gmail.com",
                                  newPassword: _passwordController.text,
                                  currentPassword:
                                      _currentPasswordController.text,
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
      AppNavigation.navigateAndFinish(context, SuccessScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }
}
