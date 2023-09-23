// import 'package:app_settings/app_settings.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart' as lo;
// import 'package:template/Utilities/helper.dart';
// import 'package:template/Utilities/toast_helper.dart';
//
// class LocationHelper{
//
//   static Future<Position?> getCurrentLocation({bool isRequired = true})async{
//     bool isEnabled = await _requireGps();
//     if(isEnabled){
//       Position? position = await _getCurrentPosition();
//       if(position!=null) {
//         return position;
//       } else {
//         if(!isRequired) return null;
//         ToastHelper.showError(message: "enable_location_permission".tr);
//         await Future.delayed(const Duration(seconds: 2));
//         await AppSettings.openAppSettings();
//       }
//     } else{
//       if(!isRequired) return null;
//       ToastHelper.showError(message: "enable_gps".tr);
//       await Future.delayed(const Duration(seconds: 2));
//       await AppSettings.openLocationSettings();
//     }
//     return null;
//   }
//
//
//   static Future<Position?> _getCurrentPosition()async{
//     LocationPermission permission = await Geolocator.checkPermission();
//     if(!(permission == LocationPermission.whileInUse && permission == LocationPermission.always)){
//       LocationPermission permission = await Geolocator.requestPermission();
//       if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){
//         try {
//           return(await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high));
//         } catch (e) {
//           debugPrint(e.toString());
//           return null;
//         }
//       }
//     }
//     return null;
//   }
//
//
//   static Future<bool> _requireGps()async{
//     lo.Location location = lo.Location();
//     bool isOn = await location.serviceEnabled();
//     if (!isOn) {
//       return (await location.requestService());
//     }
//     return isOn;
//   }
// }