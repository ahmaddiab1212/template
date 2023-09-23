import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';

class CustomDropDownUnderLineWidget<T> extends StatelessWidget {
  final Widget? prefixIcon;
  final Color? borderColor;
  final double? width;
  final List<DropdownMenuItem<T>> items;
  final T? selected;
  final void Function(T?) onChange;
  final String hint;
  final String? Function(dynamic)? validate;

  const CustomDropDownUnderLineWidget(
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
      width: width??350.w,
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
            disabledBorder:const UnderlineInputBorder(
              borderSide: BorderSide(color:Color(0xff868686)),
            ) ,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff868686)),
            ),
            errorStyle: const TextStyle(height: 0),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color:Color(0xffE0E0E0)),
            ),
            prefixIconConstraints: BoxConstraints(minWidth: prefixIcon==null?0:35.w, maxHeight: 20.w),
          ),
          items: items,
          onChanged: onChange,
        ),
      ),
    );
  }
}