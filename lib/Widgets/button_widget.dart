import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';
class CustomButtonWidget extends StatelessWidget {
  final String? title;
  final double? width,height,borderRadius,fontSize;
  final Color? backGroundColor,titleColor;
  final FontWeight? fontWeight;
  final Function() onTap;
  const CustomButtonWidget({Key? key, this.title, this.width, this.height,required this.onTap, this.backGroundColor, this.titleColor, this.borderRadius, this.fontSize, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(
        width: width??327.w,
        height:height??56.h ,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backGroundColor??ThemeClass.secondaryColor,
              borderRadius: BorderRadius.circular(borderRadius??10.w),
        ),
        child: Text(title??'',style: TextStyle(
          fontSize: fontSize??16.sp,
        fontWeight:fontWeight?? FontWeight.w500,
        color:titleColor?? ThemeClass.textButtonColor
        ),),
      ),
    );
  }
}
