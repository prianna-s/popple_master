import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:popple/services/route_generator.dart';
import 'Constant/color_const.dart';
import 'Constant/common_constant.dart';
import 'Constant/enums.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CommonConstant.initializeApp(Mode.LIVE);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Popple',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      getPages: appRoutes(),
      initialRoute: '/splash',
      theme: ThemeData(
          primaryColor: primaryColorCode,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          fontFamily: 'nunito',
          brightness: Brightness.light),
      locale:Get.locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
