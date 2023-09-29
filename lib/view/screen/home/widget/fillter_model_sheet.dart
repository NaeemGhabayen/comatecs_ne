import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../base/custom_button.dart';
import '../../../base/custom_drop_down_field.dart';

class FilterModelSheet extends StatefulWidget {
  const FilterModelSheet({key});

  @override
  State<FilterModelSheet> createState() => _FilterModelSheetState();
}

class _FilterModelSheetState extends State<FilterModelSheet> {
  List<String> maritalStatusList = <String>[
    ' ',
    "single",
    "married",
    "absolute",
  ];
  String maritalStatusValue;
  double startval1 = 20, endval1 = 70;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        color: Colors.transparent,
        child: Container(
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: ColorResources.BACKGROUND,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Container(
                  width: 67,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: Color(0xFF212121),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                )),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.filter,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'تصفية من خلال: ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF1C1C1C),
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24,),

                CustomDropDownField(
                    title: 'فئة المنتج',
                    onChange: (value) {
                      setState(() {});
                    },
                    list: maritalStatusList,
                    value: maritalStatusValue,
                    width: true),

                CustomDropDownField(
                    title: 'العلامة التجارية',
                    onChange: (value) {
                      setState(() {});
                    },
                    list: maritalStatusList,
                    value: maritalStatusValue,
                    width: true),
                SizedBox(height: 8,),
                Text(
                  'ميزانية السعر',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 15,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                  ),
                ),
SizedBox(height: 4,),
                RangeSlider(
                  min: 0,
                  max: 100,
                  divisions: 10,
                  labels: RangeLabels("$startval1\nJOD", "$endval1\nJOD"),
                  values: RangeValues(startval1, endval1),
                  activeColor: Theme.of(context).primaryColor,
                  inactiveColor: ColorResources.GREY,
                  onChanged: (RangeValues value) {
                    setState(() {
                      startval1 = value.start;
                      endval1 = value.end;
                    });
                  },
                ),

                Container(margin:const EdgeInsets.only(top: 24,left: 12,right: 12),child: CustomButton(btnTxt: 'تأكيد', onTap: () {Navigator.pop(context);})),
              ],
            )),
      ),
    );
  }
}
