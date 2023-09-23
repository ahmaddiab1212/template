import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Control/app_languages.dart';
import 'Utilities/Routing.dart';
import 'Utilities/shared_preferances_helper.dart';
import 'Utilities/update_app.dart';
import 'locale/locales.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  UpdateApp.startFlexibleUpdate();
  await SharedPref().init();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
          // ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ],
        child: ModularApp(
          module: AppModule(),
          child: const EntryPoint(),
        ),
      )
  );
}


class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context,listen: false);
    appLan.fetchLocale();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder:(_,__)=> MaterialApp.router(
        theme: ThemeData(fontFamily: 'poppins'),
        debugShowCheckedModeBanner: false,
        title: 'template',
        locale: appLan.appLocal,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
