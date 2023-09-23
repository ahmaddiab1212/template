import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';


// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final bool? readOnly;
  final String? hint;
  final Color? backGroundColor,focusedBorderColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLine,minLines;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? enable, isDense;
  final Color? borderColor;
  final FocusNode? unitCodeCtrlFocusNode;
  final double? borderRadiusValue, width, height;
  final EdgeInsets? insidePadding;
  final void Function(String?)? onSave;
  final Widget? prefixIcon, suffixIcon;
  final void Function(String)? onchange;
  final Function()? onSuffixTap;
  final void Function()? onTap;
  final List<TextInputFormatter>? formatter;

  const CustomTextFieldWidget({
    Key? key,
    this.isDense,
    this.style,
    this.onchange,
    this.insidePadding,
    this.validator,
    this.maxLine,
    this.hint,
    this.backGroundColor,
    this.controller,
    this.obscure = false,
    this.enable = true,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.borderColor,
    this.borderRadiusValue,
    this.prefixIcon,
    this.width,
    this.hintStyle,
    this.suffixIcon,
    this.onSuffixTap,
    this.height,
    this.onTap,
    this.formatter, this.unitCodeCtrlFocusNode, this.focusedBorderColor, this.onSave, this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 330.w,
      height: height ?? 50.h,
      child: TextFormField(
        onFieldSubmitted: onSave,
        focusNode:unitCodeCtrlFocusNode ,
        readOnly: readOnly ?? false,
        textAlignVertical: TextAlignVertical.center,
        validator: validator,
        onTap: () => onTap,
        enabled: enable,
        inputFormatters: formatter ?? [],
        obscureText: obscure ?? false,
        controller: controller,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 10.w),
              borderSide:
              BorderSide(color: borderColor ?? Colors.black,)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 10.w),
              borderSide:
              BorderSide(color: borderColor ?? const Color(0xff555555))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 10.w),
              borderSide: BorderSide(color:focusedBorderColor?? ThemeClass.secondaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 10.w),
              borderSide:
              BorderSide(color: borderColor ?? const Color(0xFF555555))),
          isDense: isDense ?? false,
          prefixIconConstraints: BoxConstraints(
              minWidth: prefixIcon == null ? 0 : 35.w, maxHeight: 60.w),
          suffixIconConstraints: BoxConstraints(
              minWidth: suffixIcon == null ? 0 : 45.w, maxHeight: 60.h),
          contentPadding: insidePadding ?? EdgeInsets.symmetric(vertical: 21.h),
          fillColor: backGroundColor,
          filled: backGroundColor != null,
          hintText: hint,
          prefixIcon: prefixIcon ?? SizedBox(
            width: 10.w,
          ),
          suffixIcon: suffixIcon == null
              ? SizedBox(
            width: 5.w,
          )
              : InkWell(
            onTap: onSuffixTap,
            child: SizedBox(width: 30.w,height: 60, child: suffixIcon),
          ),
          hintStyle: hintStyle ??
              TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFFA5A5A5),
                  fontWeight: FontWeight.w400),
        ),
        onChanged: onchange,
        textCapitalization: TextCapitalization.words,
        maxLines: maxLine ?? 1,
        minLines:minLines??1 ,
        keyboardType: textInputType,
        style: style ??
            TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
      ),
    );
  }
}
