import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Utilities/LayoutHelper/loading_screen.dart';
import '../../../Utilities/theme_helper.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  _LoginScreenState() : super(LoginController()) {
    con = LoginController();
  }

  late LoginController con;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: ThemeClass.primaryColor,
        body: LoadingScreen(
          loading: con.loading,
          child: Column()
        ),
      ),
    );
  }
}
