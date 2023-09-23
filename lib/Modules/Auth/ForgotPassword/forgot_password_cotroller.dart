import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Api/auth_api.dart';
import '../VerifyOtp/otp_code_screen.dart';
import '../login/login_screen.dart';
import 'set_new_password_screen.dart';


class ForgotPasswordController extends ControllerMVC {
  // singleton
  factory ForgotPasswordController() {
    _this ??= ForgotPasswordController._();
    return _this!;
  }

  static ForgotPasswordController? _this;

  ForgotPasswordController._();

  bool loading = false, autoValidate = false,showPassword=true,showConfirmPassword=true;
  late TextEditingController emailController, passwordController,confirmPasswordController;

  String? email, otpCode;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future forgetPassword(BuildContext context) async {
    setState(() {loading = true;});
    bool result = await AuthApi.resetPasswordGetCode(email: emailController.text);
    setState(() {loading = false;});
    if(result && context.mounted) Navigator.of(context).pushNamed(OtpCodeScreen.routeName, arguments: onConfirmCode);
  }

  Future onConfirmCode(String code)async{
    setState(() {loading = true;});
    bool result = await AuthApi.confirmResetPasswordCode(email: emailController.text,otpCode: code);
    setState(() {loading = false;});
    if(result) {
      otpCode = code;
      email = emailController.text;
      Modular.to.pushNamed(SetNewPasswordScreen.routeName);
    }
  }

  Future resetPassword()async {
    setState(() {loading = true;});
    bool result = await AuthApi.resetPassword(
      email: email??"",
      otpCode: otpCode??"",
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    setState(() {loading = false;});
    if(result) Modular.to.pushNamed(LoginScreen.routeName);
  }
}
