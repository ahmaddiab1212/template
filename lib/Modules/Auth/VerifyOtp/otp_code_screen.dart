import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import './otp_code_controller.dart';
import '../../../Utilities/LayoutHelper/loading_screen.dart';
import '../../../Utilities/theme_helper.dart';

class OtpCodeScreen extends StatefulWidget {
  static const routeName = "/OtpCodeScreen";
  final Function(String)? onConfirm;
  const OtpCodeScreen({Key? key, this.onConfirm}) : super(key: key);

  @override
  State createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends StateMVC<OtpCodeScreen> {
  _OtpCodeScreenState() : super(OtpCodeController()) {
    con = OtpCodeController();
  }

  late OtpCodeController con;
  final GlobalKey<FormState> formKey = GlobalKey();
@override
  void initState() {
  con.onConfirm=widget.onConfirm;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      loading: con.loading,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteBackGroundColor,
        appBar: AppBar(automaticallyImplyLeading: true,),
        body: Form(
          key: formKey,
          autovalidateMode: con.autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child:  Padding(
            padding:  EdgeInsets.symmetric(horizontal:30.w ),
            child: Column(),
          ),
        ),
      ),
    );
  }
}
