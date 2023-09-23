import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Api/auth_api.dart';


class LoginController extends ControllerMVC {
  // singleton
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }

  static LoginController? _this;

  LoginController._();

  bool loading = false,
      autoValidate = false,
      showPassword = true,
      authenticated = false,
      isHavePin = false,
      isCheck = false;

  late TextEditingController emailController,
      passwordController;

  @override
  void initState() {
    emailController = TextEditingController(text: "elsayedmahmoud409@gmail.com");
    passwordController = TextEditingController(text: "Aa123456789");
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future logIn(BuildContext context) async {
    setState(() {loading = true;});
    bool result = await AuthApi.login(userName: emailController.text, password: passwordController.text);
    setState(() {loading = false;});
    if(result && context.mounted) Navigator.of(context).pushNamed("HomeScreen.routeName");
  }
}
