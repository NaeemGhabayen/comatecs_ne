import 'package:comatecs/provider/constants_provider.dart';
import 'package:comatecs/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController _msgController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _msgFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
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

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFromFieldWidget(
                        title: 'اسم المستخدم',
                        type: TextInputType.emailAddress,
                        onChange: (String value) {},
                        focusNode: _nameFocus,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال اسم المستخدم';
                          }
                          return null;
                        },
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
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البريد الالكتروني ';
                          }
                          return null;
                        },
                      ),
                      TextFromFieldWidget(
                        title: 'رقم الهاتف',
                        type: TextInputType.phone,
                        onChange: (String value) {},
                        focusNode: _phoneFocus,
                        controller: _phoneController,
                        nextNode: _msgFocus,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال رقم الهاتف';
                          }
                          return null;
                        },
                      ),
                      TextFromFieldWidget(
                        title: 'نص الرسالة',
                        height: true,
                        obscureText: false,
                        type: TextInputType.multiline,
                        onChange: (String value) {},
                        focusNode: _msgFocus,
                        controller: _msgController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'يحب ادخال نص الرسالة';
                          }
                          return null;
                        },
                      ),


                    ],
                  ),
                ),



                SizedBox(height: 40,),
                CustomButton(btnTxt: 'إرسال',
                  isLoading: Provider.of<ConstantsProvider>(context, listen: true).isLoading,
                  onTap: ()async{
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      await Provider.of<ConstantsProvider>(context,
                          listen: false)
                          .technicalSupport(
                          email: _emailController.text,
                          phoneNumber: _phoneController.text,
                          fullName:_nameController.text,
                          message: _msgController.text,
                          callback: route);
                      print('Form submitted with value:');
                    } else {
                      print('object');
                    }

                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
  route(bool isRoute, String errorMessage) async {
    Navigator.pop(context);
    if (isRoute) {
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }


}

