import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../base/custom_button.dart';
import '../../base/text_field.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
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

                            child: Icon(Icons.arrow_back_ios,size: 20,))),
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
SizedBox(height: 36,),
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
                  height: MediaQuery.of(context).size.height*.5,
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * .8,
                  child: CustomButton(
                      btnTxt: 'حفظ',
                      onTap: () {
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
