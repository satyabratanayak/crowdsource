import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextInputAction? textInputAction;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final String? prefixText;
  final String? suffixText;
  final String labelText;
  final IconData icon;
  final bool obsecure;
  final bool isSuffix;
  final Color color;
  final double fontSize;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.textEditingController,
    required this.keyboardType,
    this.icon = Icons.account_box_rounded,
    this.obsecure = false,
    this.color = kPrimaryLight,
    this.fontSize = 15,
    this.prefixText,
    this.suffixText,
    this.onChanged,
    this.validator,
    this.isSuffix = true,
    this.maxLines,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obsecure = false;
  @override
  void initState() {
    super.initState();
    obsecure = widget.obsecure;
  }

  Icon visible = Icon(
    Icons.visibility,
    size: getWidth(25),
    color: kSecondaryText,
  );
  Icon invisible = Icon(
    Icons.visibility_off,
    size: getWidth(25),
    color: kPrimaryText,
  );

  Icon showIcon() {
    if (obsecure) {
      return invisible;
    } else {
      return visible;
    }
  }

  // bool visibility(obscureText) {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(5), vertical: getHeight(5)),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        maxLines: widget.maxLines ?? 1,
        obscureText: obsecure,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        cursorColor: kSecondaryText,
        style: kStyleParagraph,
        // style: TextStyle(
        //   fontSize: widget.fontSize,
        //   color: kPrimaryText,
        //   height: getHeight(1),
        // ),
        controller: widget.textEditingController,
        decoration: InputDecoration(
          suffixText: widget.suffixText,
          suffixStyle: const TextStyle(color: kSecondaryText),
          prefixText: widget.prefixText,
          prefixStyle: const TextStyle(color: kSecondaryText),
          suffixIcon: widget.isSuffix
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.obsecure == true) {
                        obsecure = !obsecure;
                      } else {
                        widget.textEditingController.clear();
                      }
                    });
                  },
                  icon: (widget.obsecure == true)
                      ? showIcon()
                      : Icon(
                          widget.icon,
                          size: getWidth(25),
                          color: kSecondaryText,
                        ),
                )
              : null,
          filled: true,
          fillColor: widget.color,
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: kSecondaryText,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
