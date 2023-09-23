import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  final Widget? prefixIcon;
  final Color? borderColor;
  final double? width;
  final List<DropdownMenuItem<T>> items;
  final T? selected;
  final void Function(T?) onChange;
  final String hint;
  final String? Function(dynamic)? validate;

  const CustomDropDownWidget(
      {Key? key,
        this.prefixIcon,
        this.selected,
        required this.onChange,
        required this.hint,
        this.validate,
        this.width,
        required this.items,
        required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??315.w,
      height:50.h ,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.w),
        child: DropdownButtonFormField<T>(

          borderRadius: BorderRadius.all(Radius.circular(10.w)),

          validator: validate,
          iconSize: 0.0,
          value: selected,
          style: TextStyle(
              color: ThemeClass.textBlackColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          dropdownColor: ThemeClass.inputFiledColor,
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            border:InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 10.w),
            enabled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.w),
                borderSide: BorderSide(color: ThemeClass.inputFiledColor)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
                borderSide: const BorderSide(
                  color:Colors.red,

                )),
            suffixIcon: prefixIcon,
            filled: true,
            fillColor: ThemeClass.inputFiledColor,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
            // icon: prefixIcon
          ),
          items: items,
          onChanged: onChange,
        ),
      ),
    );
  }
}