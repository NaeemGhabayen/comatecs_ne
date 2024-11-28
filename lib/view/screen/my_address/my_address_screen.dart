import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../base/custom_button.dart';
import 'widget/add_address_model_sheet.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key, }) : super(key: key);

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
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
                            child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ))),
                    const Text(
                      'العنوان',
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
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFFE1E1E1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'العنوان',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF212121),
                                      fontSize: 14,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'تفاصيل عنوان',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xB2212121),
                                      fontSize: 13,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                      PopupMenuButton<_MenuOptions>(
                        onSelected: onOptionSelected,
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<_MenuOptions>>[
                          PopupMenuItem<_MenuOptions>(
                            height: 42,
                            value: _MenuOptions.edit,
                            child: buildMenuItemContent(context, 'تعديل', Images.edit),
                          ),
                          PopupMenuItem<_MenuOptions>(
                            height: 42,
                            value: _MenuOptions.delete,
                            child: buildMenuItemContent(
                                context, 'حذف', Images.delete),
                          ),

                        ],
                        child:const Icon(
                          Icons.more_vert,
                          size: 20.0,
                        ),
                      )
                            ],
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: const Divider(
                                color: Color(0xFFE1E1E1),
                              )),
                          const Row(
                            children: [
                              Text(
                                'المدينة',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontSize: 14,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'عمان',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xB2212121),
                                  fontSize: 13,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: const Divider(
                                color: Color(0xFFE1E1E1),
                              )),
                          const Row(
                            children: [
                              Text(
                                'الدولة',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF212121),
                                  fontSize: 14,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'الأردن',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xB2212121),
                                  fontSize: 13,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                    height: MediaQuery.of(context).size.height * .3,
                    margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width * .9,
                    child:
                        CustomButton(btnTxt: 'أضافة عنوان جديد', onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return const FractionallySizedBox(
                                  child: AddAddressModelSheet(),
                                );
                              });
                        })),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onOptionSelected(_MenuOptions option) async {
    if (option == _MenuOptions.edit) {
    } else if (option == _MenuOptions.delete) {
    }
  }
  Widget buildMenuItemContent(
      BuildContext context, String text, String icon) {
    return Row(
      children: [
        Image.asset(icon, width:18,height: 18 ,),
        const SizedBox(width: 4.0),
        Text(
        text,
          textAlign: TextAlign.right,
          style: const  TextStyle(
            color: Color(0xFF212121),
            fontSize: 13,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
enum _MenuOptions { edit, delete }
