import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:template/Utilities/theme_helper.dart';

import '../../locale/locales.dart';
import 'LayoutHelper/show_images.dart';

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

extension OnTapImageExtension on Image {
  Widget showOnTap(){
    return InkWell(
      onTap: (){
        Modular.to.push(MaterialPageRoute(builder: (_)=> ShowImagesWidget(
          images: const [],
          image: image,
        )));
      },
      child: this,
    );
  }
}
extension OnTapFadeImageExtension on FadeInImage {
  Widget showOnTap(){
    return InkWell(
      onTap: (){
        Modular.to.push(MaterialPageRoute(builder: (_)=> ShowImagesWidget(
          images: const [],
          image: image,
        )));
      },
      child: this,
    );
  }
}
// ignore: camel_case_extensions
extension translate on String {
  String get tr => AppLocalizations.instance.translate(this)??"";
}



class Helper{
  static final formatter = DateFormat('yyyy-MM-dd');

  static final formatterCustom = DateFormat('yyyy MMM dd');
  static final formatterCustomTime = DateFormat('hh : mm a');
  static final formatterCustomDay = DateFormat('EEEE');
  static String  getTimeZone(DateTime dateTime) =>DateFormat.jm().format(dateTime);

  static const String imagePlaceHolder = "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png";

  static Future<bool?> _getImageSource(BuildContext context)async {
    bool? isGallery;
    await showCupertinoModalPopup(
        context: context,
        barrierDismissible: true,
        useRootNavigator: true, builder: (context) {
      return CupertinoAlertDialog(
        title: Padding(
          padding: EdgeInsets.all(10.w),
          child: Text('choose_image_source'.tr,style: TextStyle(color: ThemeClass.primaryColor,fontSize: 20.sp)),
        ),
        actions: [
          Material(
              color: Colors.grey.shade200,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  isGallery = true;
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
                    child: Text('from_gallery'.tr,style: TextStyle(color: Colors.black87,fontSize: 20.sp),)),
              )
          ),
          Material(
              color: Colors.grey.shade200,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  isGallery = false;
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
                    child: Text('from_camera'.tr,style: TextStyle(color: Colors.black87,fontSize: 20.sp),)),
              )
          ),
        ],
      );
    }
    );
    return isGallery;
  }

  static Future<File?> pickImage({required BuildContext context})async {
    bool? isGallery = await Helper._getImageSource(context);
    if(isGallery==null) return null;
    final XFile? file = await ImagePicker().pickImage(source: isGallery?ImageSource.gallery:ImageSource.camera);
    if(file!=null) return File(file.path);
    return null;
  }

  static Future<File?> pickVideo({required BuildContext context})async {
    bool? isGallery = await Helper._getImageSource(context);
    if(isGallery==null) return null;
    final XFile? file = await ImagePicker().pickVideo(source: isGallery?ImageSource.gallery:ImageSource.camera);
    if(file!=null) return File(file.path);
    return null;
  }

  static Future<List<File>> pickImages({required BuildContext context})async {
    final List<XFile> files = await ImagePicker().pickMultiImage(imageQuality: 75);
    return files.map((e) => File(e.path)).toList();
  }





  static showBottomSheetWithDynamicHeight({
    required BuildContext context,
    required Widget widget,
    Function? onDismiss,
  }) {
    showModalBottomSheet(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.w))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context)=> widget,).then((_) {
      if (onDismiss != null) onDismiss();
    });
  }


  static String getFileSize(File? file){
    if(file == null) return "0";
    return (file.lengthSync()/1024).toStringAsFixed(2);
  }

  static Future getOnlineFileSize(String? url)async{
    if(url == null) return null;
    http.Response r = await http.head(Uri.parse(url));
    return r.headers["content-length"];
  }
}