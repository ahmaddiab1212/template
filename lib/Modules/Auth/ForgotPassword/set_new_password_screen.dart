import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/LayoutHelper/loading_screen.dart';
import '../../../Utilities/theme_helper.dart';
import 'forgot_password_cotroller.dart';


class SetNewPasswordScreen extends StatefulWidget {
  static const routeName = "/SetNewPasswordScreen";

  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends StateMVC<SetNewPasswordScreen> {
  _SetNewPasswordScreenState() : super(ForgotPasswordController()) {
    con = ForgotPasswordController();
  }

  late ForgotPasswordController con;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.whiteBackGroundColor,
      appBar: AppBar(),
      body: LoadingScreen(
        loading: con.loading,
        child: SingleChildScrollView(
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
