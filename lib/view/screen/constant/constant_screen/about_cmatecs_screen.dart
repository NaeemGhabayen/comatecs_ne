import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';

class ConstantScreen extends StatefulWidget {
  final String title ;
  const ConstantScreen({key , this.title});

  @override
  State<ConstantScreen> createState() => _ConstantScreenState();
}

class _ConstantScreenState extends State<ConstantScreen> {

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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                     Text(
                     widget.title,
                      textAlign: TextAlign.right,
                      style:const TextStyle(
                        color: Color(0xFF212121),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Image.asset(Images.logo_with_name),
                SizedBox(height: 20,),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'من نحن:\n',
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 15,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                    style: TextStyle(
                      color: Color(0xCC212121),
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],

              ),
              ),
                SizedBox(height: 12,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'من نحن:\n',
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 15,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                    style: TextStyle(
                      color: Color(0xCC212121),
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],

              ),
              ),
                SizedBox(height: 12,),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'من نحن:\n',
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                        style: TextStyle(
                          color: Color(0xCC212121),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 12,),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'من نحن:\n',
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                        style: TextStyle(
                          color: Color(0xCC212121),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 12,),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'من نحن:\n',
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                        style: TextStyle(
                          color: Color(0xCC212121),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 12,),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'من نحن:\n',
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                        style: TextStyle(
                          color: Color(0xCC212121),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 12,),    Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'من نحن:\n',
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                        style: TextStyle(
                          color: Color(0xCC212121),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 12,),    Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'من نحن:\n',
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                        style: TextStyle(
                          color: Color(0xCC212121),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 12,),    Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'من نحن:\n',
                        style: TextStyle(
                          color: Color(0xFF212121),
                          fontSize: 15,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'نحن متجر إلكتروني متخصص في بيع معدات وأدوات البناء. تأسس متجرنا برؤية واحدة وهي توفير حلاً شاملاً لاحتياجات مقاولي البناء والحرفيين.',
                        style: TextStyle(
                          color: Color(0xCC212121),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 12,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
