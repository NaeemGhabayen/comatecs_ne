import 'package:comatecs/view/base/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../base/text_field.dart';


class TechnicalSupportScreen extends StatefulWidget {
  const TechnicalSupportScreen({key});

  @override
  State<TechnicalSupportScreen> createState() => _TechnicalSupportScreenState();
}

class _TechnicalSupportScreenState extends State<TechnicalSupportScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
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
                      'الدعم الفني',
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
                const SizedBox(
                  height: 32,
                ),
               const Text(
                  'إذا كان لديك أي استفسارات أو مشاكل، فلا تتردد في التواصل مع فريق الدعم الفني لدينا. سنكون سعداء للمساعدة في حل أي مشكلة تواجهك',
                  style: TextStyle(
                    color: Color(0xFF6F6F6F),
                    fontSize: 13,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(
                  height: 32,
                ),

                TextFromFieldWidget(
                  title: 'اسم المستخدم',
                  type: TextInputType.emailAddress,
                  onChange: (String value) {},
                  focusNode: _nameFocus,
                  controller: _nameController,
                  nextNode: _emailFocus,
                ),
                TextFromFieldWidget(
                  title: 'البريد الالكتروني',
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
                  nextNode: _nameFocus,
                ),

                TextFromFieldWidget(
                  title: 'نص الرسالة',
                  height: true,
                  obscureText: false,
                  type: TextInputType.multiline,
                  onChange: (String value) {},
                  focusNode: _phoneFocus,
                  controller: _phoneController,
                  nextNode: _nameFocus,
                ),
                
                SizedBox(height: 40,),
                CustomButton(btnTxt: 'إرسال',onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              margin: EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Image.asset(Images.smile , width: 24,height: 24,),
                                  SizedBox(
                                    height: 4,
                                  ),
                                const  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                     'شكراً لتوصلك بفريق الدعم الفني. سنعمل على الرد على استفسارك في أقرب وقت ممكن. نشكرك على صبرك وتفهمك.',                  textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF6F6F6F),
                                        fontSize: 12,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                ],
                              ),
                            ));

                      });
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
