import 'package:flutter/material.dart';

import '../../../../utill/color_resources.dart';
import '../../../base/custom_button.dart';
import '../../../base/text_field.dart';

class AddAddressModelSheet extends StatefulWidget {
  const AddAddressModelSheet({Key? key, }) : super(key: key);

  @override
  State<AddAddressModelSheet> createState() => _AddScreenModelSheetState();
}

class _AddScreenModelSheetState extends State<AddAddressModelSheet> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final FocusNode _addressFocus = FocusNode();
  final FocusNode _countryFocus = FocusNode();
  final FocusNode _cityFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        color: Colors.transparent,
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: ColorResources.BACKGROUND,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Container(
                      width: 67,
                      height: 5,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF212121),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    )),
                const   SizedBox(
                  height: 32,
                ),
              const  Text(
                  'إضافة عنوان جديد',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const    SizedBox(
                  height: 16,
                ),

                TextFromFieldWidget(
                  title: 'العنوان *',
                  type: TextInputType.text,
                  onChange: (String value) {},
                  focusNode: _addressFocus,
                  controller: _addressController,
                  nextNode: _countryFocus,
                ),
                TextFromFieldWidget(
                  title: 'الدولة *',
                  type: TextInputType.emailAddress,
                  onChange: (String value) {},
                  focusNode: _countryFocus,
                  controller: _countryController,
                  nextNode: _cityFocus,
                ),
                TextFromFieldWidget(
                  title: 'المدينة *',
                  type: TextInputType.phone,
                  onChange: (String value) {},
                  focusNode: _cityFocus,
                  controller: _cityController,
                ),


                Container(margin:const EdgeInsets.only(top: 24,left: 12,right: 12),child: CustomButton(btnTxt: 'تأكيد', onTap: () {Navigator.pop(context);})),
              ],
            )),
      ),
    );
  }
}
