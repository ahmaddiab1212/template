import 'dart:developer';

import '../../Utilities/toast_helper.dart';
import '../Models/user_model.dart';
import '../Utilities/shared_preferances_helper.dart';
import 'api_helper.dart';

class AuthApi{

  static Future<bool> login({required String userName,required String password})async{
    var response = await APIHelper.postRequest(
      url: APIHelper.login,
      body: {
        "email": userName,
        "password": password
      },
    );
    if (response == null) return false;
    log(response.toString());
    if (response["status"] == true) {
      SharedPref.saveUserObj(user: UserModel.fromMap(response["data"]["user"]..["token"] = response["data"]["token"]));
      return true;
    } else {
      ToastHelper.showError(message: response["message"]);
      return false;
    }
  }


  static Future<bool> resetPasswordGetCode({required String email})async{
    var response = await APIHelper.postRequest(
      url: APIHelper.resetPasswordGetCode,
      body: {
        "email": email,
      },
    );
    if (response == null) return false;
    log(response.toString());
    if (response["status"] == true) {
      return true;
    } else {
      ToastHelper.showError(message: response["message"]);
      return false;
    }
  }

  static Future<bool> confirmResetPasswordCode({required String email,required String otpCode})async{
    var response = await APIHelper.postRequest(
      url: APIHelper.verifyCode,
      body: {
        "email": email,
        "code": otpCode
      },
    );
    if (response == null) return false;
    log(response.toString());
    if (response["status"] == true) {
      return true;
    } else {
      ToastHelper.showError(message: response["message"]);
      return false;
    }
  }

  static Future<bool> resetPassword({required String email,required String otpCode,
  required String password,required String confirmPassword})async{
    var response = await APIHelper.postRequest(
      url: APIHelper.resetPassword,
      body: {
        "email": email,
        "code": otpCode,
        "password": password,
        "password_confirmation": confirmPassword
      },
    );
    if (response == null) return false;
    log(response.toString());
    if (response["status"] == true) {
      ToastHelper.showSuccess(message: response["message"]);
      return true;
    } else {
      ToastHelper.showError(message: response["message"]);
      return false;
    }
  }
}