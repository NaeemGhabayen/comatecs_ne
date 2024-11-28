import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';

class CustomDropDownField extends StatelessWidget {
  String? title;
  void Function(String?)? onChange;
  String? icons;
  bool? width;
  List<String>? list;
  String? value;
  bool? isReadOnly;

  CustomDropDownField({
    this.title,
    this.icons,
    this.onChange,
    this.list,
    this.value,
    this.width,
    this.isReadOnly = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title!,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 0.11,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 52,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .9,
          padding: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE1E1E1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: DropdownButton2<String>(
            value: value,
            isExpanded: true,
            iconStyleData: const IconStyleData(
              iconSize: 24,
              icon: Icon(Icons.keyboard_arrow_down_outlined),
              iconEnabledColor: Color(0xFFE1E1E1),
              iconDisabledColor: Colors.grey,
            ),
            hint: Text(
              title!,
              style: const TextStyle(
                  color: Color.fromRGBO(33, 47, 62, .61),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              elevation: 8,
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStateProperty.all<double>(6),
                thumbVisibility: WidgetStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
            underline: const SizedBox(),
            style: const TextStyle(color: ColorResources.BLACK),
            onChanged: onChange!,
            items: list!.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                enabled: !isReadOnly!,
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const  SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
