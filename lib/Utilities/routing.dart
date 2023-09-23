import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Modules/Auth/ForgotPassword/forgot_password_screen.dart';
import '../Modules/Auth/ForgotPassword/set_new_password_screen.dart';
import '../Modules/Auth/VerifyOtp/otp_code_screen.dart';
import '../Modules/Auth/login/login_screen.dart';
import '../Modules/splash_screen.dart';

class AppModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SplashScreen()),

    defaultRoute(routeName: LoginScreen.routeName,screen: const LoginScreen()),
    defaultRoute(routeName: SetNewPasswordScreen.routeName,screen: const SetNewPasswordScreen()),
    defaultRoute(routeName: SplashScreen.routeName,screen: const SplashScreen()),
    defaultRoute(routeName: ForgotPasswordScreen.routeName,screen: const ForgotPasswordScreen()),

    ChildRoute(
      OtpCodeScreen.routeName,
      child: (_, args) => OtpCodeScreen(onConfirm: args.data),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
    ),
  ];

  static ChildRoute defaultRoute({required String routeName,required Widget screen}){
    return ChildRoute(
      routeName,
      child: (_, args) => screen,
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
    );
  }
}


