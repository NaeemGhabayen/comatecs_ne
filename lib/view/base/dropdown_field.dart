import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utill/color_resources.dart';

class DropDownField extends StatelessWidget {
  String title;
  Function onChange;
  String icons;
  bool width;
  List<String> list;
  String value;
  bool isReadOnly;

  DropDownField({
    Key key,
    this.title,
    this.icons,
    this.onChange,
    this.list,
    this.value,
    this.width,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: width
          ? MediaQuery.of(context).size.width * .8
          : MediaQuery.of(context).size.width * .38,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 12,
      ),
      decoration: BoxDecoration(
        border:
            Border.all(color: Color.fromRGBO(212, 226, 235, .5), width: 1.5),
        borderRadius: BorderRadius.circular(8),
        color: Color.fromRGBO(212, 226, 235, .22),
        shape: BoxShape.rectangle,
      ),
      child: DropdownButton2<String>(
        value: value,
        isExpanded: true,
        iconStyleData: const IconStyleData(
          iconSize: 24,
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          iconEnabledColor: Color.fromRGBO(167, 183, 200, 1),
          iconDisabledColor: Colors.grey,
        ),
        hint: Text(
          title,
          style: const TextStyle(
              color: Color.fromRGBO(33, 47, 62, .61),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          padding: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          elevation: 8,
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
        underline: const SizedBox(),
        style: const TextStyle(color: ColorResources.BLACK),
        onChanged: onChange,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            enabled: !isReadOnly,
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
