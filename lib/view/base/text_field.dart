import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextFromFieldWidget extends StatefulWidget {
  String? title;
  final String? Function(String?)? validator;
  final  Function(String)? onChange;
  TextInputType? type;
  bool? isReadOnly;
  TextEditingController? controller;
  FocusNode? focusNode;
  FocusNode? nextNode;
  bool? width;
  bool? height;
  Color? color;
  bool? isRequired;
  bool? obscureText;

  TextFromFieldWidget(
      {Key? key,
      this.title,
      this.validator,
      this.onChange,
      this.controller,
      this.focusNode,
      this.nextNode,
      this.type,
      this.color,
      this.isReadOnly = false,
      this.isRequired = false,
      this.height = false,
      this.obscureText = false,
      this.width = false})
      : super(key: key);

  @override
  _TextFromFieldWidgetState createState() => _TextFromFieldWidgetState();
}

class _TextFromFieldWidgetState extends State<TextFromFieldWidget> {
  bool isTextObscured = true;
  IconData eyeIcon = CupertinoIcons.eye_slash;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.title!,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF212121),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: widget.width!
                ? MediaQuery.of(context).size.width * .38
                : MediaQuery.of(context).size.width * .9,
            // margin: const EdgeInsets.symmetric(vertical: 12),
            // decoration: BoxDecoration(
            //   border:
            //       Border.all(color: Color.fromRGBO(212, 226, 235, .5), width: 1.5),
            //   borderRadius: BorderRadius.circular(8),
            //   color:widget.color==null? Color.fromRGBO(212, 226, 235, .22):widget.color,
            //   shape: BoxShape.rectangle,
            // ),
            child: TextFormField(
              textAlign: TextAlign.start,
              keyboardType: widget.type,
              style: const TextStyle(
                color: Color(0xCC212121),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              onChanged: widget.onChange!,
              validator: widget.validator!,
              readOnly: widget.isReadOnly!,
              controller: widget.controller,
              obscureText: widget.obscureText! ? isTextObscured : false,
              focusNode: widget.focusNode,
              enableInteractiveSelection: true,

              maxLines: widget.obscureText! ? 1 : null,
              onFieldSubmitted: (v) {
                FocusScope.of(context).requestFocus(widget.nextNode);
              },

              decoration: InputDecoration(
                suffixIcon: widget.obscureText!
                    ? IconButton(
                        icon: Icon(
                          eyeIcon,
                          color: const Color(0x66212121),
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            isTextObscured = !isTextObscured;
                            eyeIcon = eyeIcon == CupertinoIcons.eye_slash
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash;
                          });
                        },
                      )
                    : const SizedBox(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                hintText: widget.title,
                hintStyle: const TextStyle(
                    color: Color.fromRGBO(33, 47, 62, .61),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(
                    color: Color(0xFFE1E1E1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(
                  color: Color(0xFFE1E1E1),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.redAccent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorStyle: const TextStyle(
                  fontSize: 10,
                  height: 1,
                ),
                focusedBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide:
                      const BorderSide(color: Color(0x7F212121), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
