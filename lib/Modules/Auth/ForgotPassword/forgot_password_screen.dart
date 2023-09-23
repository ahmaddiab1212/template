import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/LayoutHelper/loading_screen.dart';
import '../../../Utilities/LayoutHelper/update_screen.dart';
import '../../../Utilities/theme_helper.dart';
import 'forgot_password_cotroller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = "/ForgetPasswordScreen";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ForgetPasswordStep1ScreenState();
}

class _ForgetPasswordStep1ScreenState extends StateMVC<ForgotPasswordScreen> {
  _ForgetPasswordStep1ScreenState() : super(ForgotPasswordController()) {
    con = ForgotPasswordController();
  }

  late ForgotPasswordController con;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return UpdateAppScreen(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteBackGroundColor,
        appBar: AppBar(),
        body: LoadingScreen(
          loading: con.loading,
          child: Form(
            key: formKey,
            autovalidateMode: con.autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child:  Padding(
              padding:  EdgeInsets.symmetric(horizontal:30.w ),
              child: Column()
            ),
          ),
        ),
      ),
    );
  }
}
