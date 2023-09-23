import 'package:flutter/material.dart';


import '../Utilities/theme_helper.dart';
import 'Auth/Login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName="/SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }
  init()async{
    await Future.delayed(const Duration(seconds: 2));
    if(context.mounted) Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ThemeClass.primaryColor,
      body: const Center(
        child: CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}