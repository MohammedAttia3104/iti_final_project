import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validate;
  final void Function(String)? textOnChanged;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textAction;
  final FocusNode? focusNode;
  bool? isObsecured = false;

  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validate,
      required this.textOnChanged,
      required this.keyboardType,
      this.onEditingComplete,
      this.textAction,
      this.focusNode,
      this.isObsecured,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: kTXTFormFieldFilledColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            SpecificSize.textFormFieldBorderRaduis,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            SpecificSize.textFormFieldBorderRaduis,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            SpecificSize.textFormFieldBorderRaduis,
          ),
        ),
        hintText: hintText,
        contentPadding: EdgeInsets.all(20.0.r),
      ),
      validator: validate,
      onChanged: textOnChanged,
      keyboardType: keyboardType,
      obscureText: isObsecured ?? false,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      textInputAction: textAction,
    );
  }
}
